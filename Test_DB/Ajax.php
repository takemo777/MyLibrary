<?php

// このファイルは非同期通信で貸出処理や返却処理を行うためのファイル

// DAO.php,USER.php,Book.phpに保存されているPHPスクリプトを取り込む
require_once("db.php");

$process = filter_input(INPUT_POST, 'processing');

switch($process){
    case 'lent'://Processingがlentの場合
        //user_idとbook_idを受け取る
        $user_id = filter_input(INPUT_POST, 'user_id');
        $book_id = filter_input(INPUT_POST, 'book_id');
        // DAOクラスをインスタンス化
        $dao = new DAO();
        // 貸出処理を実行
        echo $dao->lendingProcess($user_id, $book_id);
        break;
    
    case 'returnLent'://ProcessingがReturnLentの場合
        //user_idとbook_idを受け取る
        $user_id = filter_input(INPUT_POST, 'user_id');
        $book_id = filter_input(INPUT_POST, 'book_id');
        // DAOクラスをインスタンス化
        $dao = new DAO();
        // 返却処理を実行
        echo $dao->returnProcess($user_id, $book_id);
        break;

    case 'delete'://Processingがdeleteの場合
        //book_idを受け取る
        $book_id = filter_input(INPUT_POST, 'book_id');
        // DAOクラスをインスタンス化
        $dao = new DAO();
        //削除を実行
        echo $dao->deleteProcess($book_id);
        break;

    
    case 'ISBN'://ProcessingがISBNの場合
        //ISBNを受け取る
        $ISBN = filter_input(INPUT_POST, 'ISBN');
        // DAOクラスをインスタンス化
        $dao = new DAO();
        //ISBNからbook_idを取り出す処理を実行
        echo $dao->searchISBN($ISBN);
        break;
        
}

// このファイルの処理を終了する
exit;