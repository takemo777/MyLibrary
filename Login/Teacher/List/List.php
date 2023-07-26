<?php
// DAO.php,USER.phpに保存されているPHPスクリプトを取り込む
require_once("../../../Test_DB/db.php");
require_once("../../../Test_DB/User.php");
session_start();
// user_idがNULLまたは空の時、ログインページに遷移させる
if (!isset($_SESSION["user_id"])) {
    header("Location: ../../Login.php");
    exit;
}
// DAOクラスをインスタンス化
$dao = new DAO();
// 引数にセッション変数のuser_idを指定してDAOクラスのgetUserメソッドを実行しUserインスタンスを変数userに格納
$user = $dao->getUser($_SESSION["user_id"]);
?>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <title>図書館システム</title>
  <link rel="stylesheet" href="List.css" type="text/css">
</head>

<body>
  <div class="main">
    <!--ヘッダー-->
    <?php include "../../../Test_DB/Header.php"; ?>
  </div><br>
  <!--パンくずリスト-->
  <ul class="breadcrumb">
    <li class="pan"><a href="../Home/TeacherHome.php">ホーム > 返却滞納者一覧</a></li>
  </ul>


<div class="container">
<table class="user-table">
    <thead>
      <tr>
        <th>ユーザー名</th>
        <th>本の名前</th>
        <th>返却期限</th>
        <th>滞納日数</th>
      </tr>
    </thead>
    <tbody>
      <?php
      $delinquentUsers = $dao->getDelinquentUsers();
      foreach ($delinquentUsers as $user) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($user["user_name"]) . "</td>";
        echo "<td>" . htmlspecialchars($user["book_name"]) . "</td>";
        echo "<td>" . htmlspecialchars($user["return_due_date"]) . "</td>";
        echo "<td>" . htmlspecialchars($user["overdue_days"]) . "日</td>";
        echo "</tr>";
      }
      ?>
    </tbody>
  </table>
</div>

<div class="buttonContainer">
    <button id="returnButton" onclick="redirectToHome()">戻る</button>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script>
    //ホームに戻る
    function redirectToHome() {
      // 別のページにリダイレクト（移動）
      window.location.href = "../Home/TeacherHome.php";
    }
  </script>

</body>