<?php
// DAO.php,USER.phpを読み込み
require_once("../../../Test_DB/db.php");
require_once("../../../Test_DB/User.php");
require_once("../../../Test_DB/Book.php");

session_start();
if (!isset($_SESSION["user_id"])) {
  header("Location: login.php");
  exit;
}

$dao = new DAO();
$user = $dao->getUser($_SESSION["user_id"]);
$book = $dao->clickBook($_POST["book_id"]);

?>
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <title>白石学園ポータルサイト</title>
  <link rel="stylesheet" href="Other.css" type="text/css">
</head>

<body>
  <div class="main">
    <!--ヘッダー-->
    <div class="main">
      <div id="contents"><a href="../Home/StudentHome.php">白石学園ポータルサイト</a>
      </div>
      <div id="login">
        ログイン者:<?php echo $user->getUserName();  ?><br>
        区分:<?php echo $user->getAffiliationName(); ?><br>
        学科:<?php echo $user->getUserTypeName(); ?>
      </div>
    </div>
  </div> <!--パンくずリスト-->
  <ul class="breadcrumb">
    <li><a href="../Home/StudentHome.php">ホーム</a></li>
  </ul>
  <div class="books"> <!--本の詳細-->
    <img src="<?php echo '../../../image/' . $book["image"]; ?>" + class="example1" style="vertical-align:top">
    <div class="text">
      <p>
      <h2>著書名:<?php echo $book["book_name"]; ?></h2>
      </p>
      <p>
      <h2>著者名 :<?php echo $book["author"]; ?></h2>
      </p>
      <p>
      <h2>出版社：<?php echo $book["publisher"]; ?></h2>
      <p>
      <p>
      <h2>貸出状況： <?php echo $book["lending_status"]; ?></h2>
      </p>
      <p>
      <h2>返却予定日： <?php echo $book["return_due_date"]; ?></h2>
      </p>
    </div>
  </div> <!--貸出、戻るボタン-->
  <div class="buttonContainer">
    <button id="returnButton" onclick="redirectToHome()">戻る</button>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script>
    //ホームに戻る
    function redirectToHome() {
      // 別のページにリダイレクト（移動）
      window.location.href = "../Home/StudentHome.php";
    }
  </script>
</body>

</html>