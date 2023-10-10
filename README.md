# ２年前期グループ開発「図書館システム」
＜ソースコード＞

MyLibrary/Login

Check.php
ログイン時にIDとパスワードが一致しているか確認する

Login.php
ログイン画面

LoginError.php
ログインIDとパスワードが一致していなかった場合に出るページ

Logout.php
ログアウト時にログイン情報を破棄するページ

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

MyLibrary/Login/Student/

MyLibrary/Login/Student/History
History.php
本の貸出履歴のページ

MyLibrary/Login/Student/Home
StudentHome.php
ユーザー（生徒）側トップページ
Barcode.html
バーコード読み取り時に出てくるポップアップページ

MyLibrary/Login/Student/Lent
Lent.php
貸出可能状態の本に出てくるページ

MyLibrary/Login/Student/Other
Other.php
他人が貸出中の本に出てくるページ

MyLibrary/Login/Student/Ranking
Ranking.php
本の貸出ランキングを表示するページ

MyLibrary/Login/Student/ReturnLent
ReturnLent.php
自分が本を借りているときに出てくるページ

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

MyLibrary/Login/Teacher/

MyLibrary/Login/Teacher/Add
Add.php
本の追加時に情報を入力するページ
Upload.php
追加した本をデータベースに書き込む

MyLibrary/Login/Teacher/Chenge
Chenge.php
本の内容を編集するときに出てくるページ
Upload.php
編集した本をデータベースに書き込む

MyLibrary/Login/Teacher/Edit
Edit.php
編集・削除する本を選んだときに出てくるページ

MyLibrary/Login/Teacher/Home
TeacherHome.php
管理者（先生）側トップページ

MyLibrary/Login/Teacher/LastMonthLending
index.py
本の貸出冊数予想をするときに使用するPythonプログラム
LastMonthLending.php
本の貸出冊数予想を表示するページ

MyLibrary/Login/Teacher/List
List.php
貸出遅滞者の一覧を表示するページ

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

MyLibrary/Test_DB

Ajax.php
非同期通信を行うときに使用するプログラム

BreadCrumb.php
ページ共通のパンくずリスト

db.php
非同期通信時に使用するデーターベース制御用のプログラム

Header.php
ページ共通のヘッダー
