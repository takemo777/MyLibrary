# ２年前期チーム開発「図書館システム」

## 開発言語
- PHP
- JavaScript
- HTML
- Python

## データベース
- MySQL

## 設計パターン
- DAOパターン

## 作品概要
このWebアプリケーションは、2年生の前学期のグループ活動で開発された図書館システムです。
一般公開はされていません。

### 機能概要

#### 管理者側
- ログイン機能
- 本の一覧と貸出状況の表示、検索機能
- 本の追加（画像や名前、出版社などの登録）
- 本の削除
- 返却滞納している生徒と本の情報を一覧表示

#### 生徒側
- ログイン機能付き
- 本の一覧と自身の貸出状況の表示、検索機能
- 本の貸出と返却
- 自身の貸出の履歴
- 生徒の中でよく貸し出されている本のランキング表示

## 図書館システム 導入方法

### 1.XAMPPをインストールする
XAMPPを
https://www.apachefriends.org/jp/index.html
からWindows版をダウンロードし、xampp-windows-x64-8.2.4-0-VS16-installer.exeを実行し、インストールします。
（確認画面が数回出ますが、Nextで進めてください）

### 2.Pythonをインストールする
Pythonを
https://www.python.org/downloads/
からダウンロードし、.exeを実行し、インストールします。
（基本的なPythonのライブラリはここで入ります）

### 3.Pythonで必要なライブラリをダウンロードする
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

### 4.図書館システムを設置する
xammpフォルダーの中にあるhtdocsの中にMyLibraryが来るように設置してください

### 5.xamppを起動させて、データベースを作る
xamppフォルダーの中にあるxampp-control.exeを起動させてください
ApacheとMySQLを右のStartで起動させてください。
その後、MySQLと同じ行にあるAdminを押してください。
ブラウザでphpMyAdminが立ち上がります。

phpMyAdminの左上にある「新規作成」を選択します。
データベース名は「library」にしてください。
その後、「新しいテーブルを作成」と出ますが、上のインポートを選択してください。
「ファイルを選択」で同封しているlibrary.sqlを選択してページ一番下にある「インポート」を選択してください

### 6.完成
これで準備は完了です。
http://localhost/MyLibrary/Login/Login.php
にアクセスしてください。
ログインIDとパスワードはログインユーザー一覧.txtにあります。

【注意】
このシステムはMicrosoft Edgeでの動作を確認しています。
他のブラウザで実行するとボタンなどの位置がズレたりする可能性があります。
