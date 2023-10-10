# ２年前期グループ開発「図書館システム」
＜ソースコード一覧＞

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

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

＜図書館システム 導入方法＞

1.XAMPPをインストールする
XAMPPを
https://www.apachefriends.org/jp/index.html
からWindows版をダウンロードし、xampp-windows-x64-8.2.4-0-VS16-installer.exeを実行し、インストールします。
（確認画面が数回出ますが、Nextで進めてください）

2.Pythonをインストールする
Pythonを
https://www.python.org/downloads/
からダウンロードし、.exeを実行し、インストールします。
（基本的なPythonのライブラリはここで入ります）

3.Pythonで必要なライブラリをダウンロードする
この「図書館システム」では、ニューラルネットワークを活用した本の貸出冊数予想を行うため、別のライブラリのインストールが必要です。
Windowsの「検索」からcmdと検索し、コマンドプロンプトを起動させます。
コマンドプロンプトに以下をコピー＆ペーストして実行させてください。
※たくさんのライブラリをインストールするため、少し時間がかかります

py -m pip install contourpy==1.1.0
py -m pip install cycler==0.11.0
py -m pip install fonttools==4.42.1
py -m pip install japanize-matplotlib==1.1.3
py -m pip install kiwisolver==1.4.5
py -m pip install matplotlib==3.7.2
py -m pip install numpy==1.25.2
py -m pip install packaging==23.1
py -m pip install Pillow==10.0.0
py -m pip install pyparsing==3.0.9
py -m pip install python-dateutil==2.8.2
py -m pip install six==1.16.0
py -m pip install sklearn

4.図書館システムを設置する
xammpフォルダーの中にあるhtdocsの中にMyLibraryが来るように設置してください

5.xamppを起動させて、データベースを作る
xamppフォルダーの中にあるxampp-control.exeを起動させてください
ApacheとMySQLを右のStartで起動させてください。
その後、MySQLと同じ行にあるAdminを押してください。
ブラウザでphpMyAdminが立ち上がります。

phpMyAdminの左上にある「新規作成」を選択します。
データベース名は「library」にしてください。
その後、「新しいテーブルを作成」と出ますが、上のインポートを選択してください。
「ファイルを選択」で同封している。library.sqlを選択してページ一番下にある「インポート」を選択してください

6.完成
これで準備は完了です。
http://localhost/MyLibrary/Login/Login.php
にアクセスしてください。
ログインIDとパスワードはログインユーザー一覧.txtにあります。

【注意】
このシステムはMicrosoft Edgeでの動作を確認しています。
他のブラウザで実行するとボタンなどの位置がズレたりする可能性があります。
