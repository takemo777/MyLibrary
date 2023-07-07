<?php

require_once("User.php");
require_once("Book.php");

class DAO
{
    private $user = "root";
    private $pwd = "pathSQL";
    private $dsn = "mysql:host=localhost;port=3306;dbname=library;";
    private $conn;

    // このクラスをインスタンス化時にデータベースに接続
    public function __construct()
    {
        $this->conn = new PDO($this->dsn, $this->user, $this->pwd);
    }

    // ログインしたユーザーの情報を取得(User型で返す)
    public function getUser($login_id): User
    {
        $stmt = $this->conn->prepare('SELECT u.user_id, u.affiliation_id, a.affiliation_name, ut.user_type_name, u.user_type_id, u.user_name, u.password
         FROM `users` AS u
         LEFT JOIN affiliation AS a
         ON u.affiliation_id = a.affiliation_id
         LEFT JOIN user_type as ut
         ON u.user_type_id = ut.user_type_id
         WHERE u.user_id = :login_id');

        $stmt->bindValue(":login_id", $login_id);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $user = new User($result["user_id"], $result["user_name"], $result["affiliation_id"], $result["affiliation_name"], $result["user_type_name"], $result["user_type_id"], $result["password"]);

        return $user;
    }

    // ログインしているユーザーが借りている本の情報を取得するためのSQL文
    public function getMyBooks(&$user)
    {
        $stmt = $this->conn->prepare("SELECT l.user_id, b.book_id, b.book_name, b.author, b.publisher, b.remarks, b.image, l.lending_status
                                        FROM book AS b
                                        INNER JOIN lent AS l
                                        ON l.book_id = b.book_id
                                        WHERE b.affiliation_id = :affiliation_id
                                        AND l.user_id = :user_id
                                        AND l.lending_status = 'impossible'
                                        ORDER BY b.book_id");

        $stmt->bindValue(":user_id", $user->getUserId());
        $stmt->bindValue(":affiliation_id", $user->getAffiliationId());
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return json_encode($result);
    }

    // ログインしているユーザーが借りている本の情報を取得するためのSQL文
    public function getAllBooks(&$user)
    {
        $stmt = $this->conn->prepare("SELECT l.user_id, b.book_id, b.book_name, b.author, b.publisher, b.remarks, b.image, l.lending_status
                                         FROM book AS b
                                         LEFT JOIN lent2 AS l
                                         ON l.book_id = b.book_id 
                                         WHERE affiliation_id = :affiliation_id
                                         ORDER BY b.book_id");

        $stmt->bindValue(":affiliation_id", $user->getAffiliationId());
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return json_encode($result);
    }

    // ログインしているユーザーが所属しているクラスの全ての貸出中の本を取得するためのSQL文
    public function getLentNowBooks(&$user)
    {
        $stmt = $this->conn->prepare("SELECT l.user_id, b.book_id, b.book_name, b.author, b.publisher, b.remarks, b.image, l.lending_status
                                            FROM book AS b         
                                            LEFT JOIN lent AS l            
                                            ON l.book_id = b.book_id           
                                            WHERE b.affiliation_id = :affiliation_id 
                                            AND l.lending_status = 'impossible'  
                                            ORDER BY b.book_id");

        $stmt->bindValue(":affiliation_id", $user->getAffiliationId());
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return json_encode($result);
    }

    // 選択した本の情報を取得
    public function clickBook($book_id): array
    {
        $sql = "SELECT l.user_id, b.book_id, b.book_name, b.author, b.publisher, b.remarks, b.image, l.return_due_date, l.lending_status
                FROM book as b
                LEFT JOIN lent2 as l
                ON b.book_id = l.book_id
                WHERE b.book_id = :book_id;";
        // SQL実行準備
        $stmt = $this->conn->prepare($sql);
        // :book_idにセッション変数から取得したbook_idを代入
        $stmt->bindValue(":book_id", $book_id);
        // SQL文を実行
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result;
    }

    // 貸出処理
    public function lendingProcess($user_id, $book_id)
    {
        $sql = "INSERT INTO lent(book_id, user_id, lent_time, return_due_date,lending_status)
                 VALUES (:book_id, :user_id, :lent_time, :return_due_date,'impossible')";
        // SQL実行準備
        $stmt = $this->conn->prepare($sql);

        $lent_date = new DateTime();
        // 時間を日本時間に変更
        date_default_timezone_set('Asia/Tokyo');
        // 貸出日を取得
        $lent_time = new DateTime();
        // 返却予定日を取得
        $return_due_date = new DateTime("+7 day");
        // 貸出日・返却予定日をDateTime型から文字列型に変換
        $lent_time = $lent_time->format('Y-m-d');
        $return_due_date = $return_due_date->format('Y-m-d');

        $stmt->bindValue(":book_id", $book_id);
        $stmt->bindValue(":user_id", $user_id);
        $stmt->bindValue(":lent_time", $lent_time);
        $stmt->bindValue(":return_due_date", $return_due_date);
        $stmt->execute();
    }

    // 返却処理
    public function returnProcess($user_id, $book_id)
    {
        $sql = "UPDATE lent
                SET return_time=:return_time,lending_status='possible'
                WHERE user_id = :user_id AND book_id = :book_id AND lending_status = 'impossible'";

        $stmt = $this->conn->prepare($sql);

        $return_time = new DateTime("+7 day");
        $return_time = $return_time->format('Y-m-d');

        $stmt->bindValue(":return_time", $return_time);
        $stmt->bindValue(":user_id", $user_id);
        $stmt->bindValue(":book_id", $book_id);

        $stmt->execute();
    }
}
