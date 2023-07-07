<?php
require_once("db.php");

$user_id = filter_input(INPUT_POST, 'user_id');
$book_id = filter_input(INPUT_POST, 'book_id');

$dao = new DAO();

echo $dao->lendingProcess($user_id, $book_id);

exit;
