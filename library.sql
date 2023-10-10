-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2023-08-25 16:29:32
-- サーバのバージョン： 8.0.33
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `library`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `affiliation`
--

CREATE TABLE `affiliation` (
  `affiliation_id` int NOT NULL,
  `affiliation_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- テーブルのデータのダンプ `affiliation`
--

INSERT INTO `affiliation` (`affiliation_id`, `affiliation_name`) VALUES
(2, 'ITE3-1'),
(1, 'ITE4-1');

-- --------------------------------------------------------

--
-- テーブルの構造 `book`
--

CREATE TABLE `book` (
  `book_id` int NOT NULL,
  `affiliation_id` int DEFAULT NULL,
  `book_name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `publisher` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `ISBN` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- テーブルのデータのダンプ `book`
--

INSERT INTO `book` (`book_id`, `affiliation_id`, `book_name`, `author`, `remarks`, `publisher`, `image`, `ISBN`) VALUES
(1, 1, '1', 'A', NULL, '翔泳社', '1.jpg', 9784798169804),
(2, 1, '2', 'B', '教室外持ち出し禁止', '技術評論社', '2.jpg', 9784297124014),
(3, 1, '3', 'C', NULL, '技術評論社', '3.jpg', 9784297118013),
(4, 1, '4', 'D', '教室外持ち出し禁止', 'SBクリエイティブ', '4.jpg', 9784797395150),
(5, 1, '5', 'E', NULL, 'ソシム', '5.jpg', 9784802612906),
(6, 1, '6', 'F', NULL, '実務教育出版', '6.jpg', 9784788925564),
(7, 1, '7', 'G', NULL, '実務教育出版', '7.jpg', 9784788925557),
(8, 1, '8', 'H', NULL, 'インプレス', '8.jpg', 9784295008958),
(9, 1, '9', 'I', NULL, 'インプレス', '9.jpg', 9784295007623),
(10, 1, '10', 'J', '教室外持ち出し禁止', 'インプレス', '10.jpg', 9784295011392),
(11, 1, '11', 'K', NULL, 'インプレス', '11.jpg', 9784295012412),
(12, 1, '12', 'L', NULL, '翔泳社', '12.jpg', 9784798157207),
(13, 1, '13', 'M', NULL, '翔泳社', '13.jpg', 9784798165943),
(14, 1, '14', 'N', NULL, '翔泳社', '14.jpg', 9784798151977),
(15, 1, '15', 'O', NULL, '翔泳社', '15.jpg', 9784798156507),
(16, 1, '16', 'P', NULL, '翔泳社', '16.jpg', 9784798169804),
(17, 1, '17', 'Q', NULL, '東京図書', '17.jpg', 9784489023323),
(18, 1, '18', 'R', NULL, 'インプレス', '18.jpg', 9784295005940),
(19, 1, '19', 'S', NULL, 'インプレス', '19.jpg', 9784295009948),
(20, 1, '20', 'T', NULL, '翔泳社', '20.jpg', 9784798166575);

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `book2`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `book2` (
`ISBN` bigint
,`num` bigint unsigned
);

-- --------------------------------------------------------

--
-- テーブルの構造 `images`
--

CREATE TABLE `images` (
  `images_id` int DEFAULT NULL,
  `image_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- テーブルのデータのダンプ `images`
--

INSERT INTO `images` (`images_id`, `image_pass`) VALUES
(1, '1.jpg'),
(2, '2.jpg'),
(3, '3.jpg');

-- --------------------------------------------------------

--
-- テーブルの構造 `lent`
--

CREATE TABLE `lent` (
  `lent_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `lent_time` date NOT NULL,
  `return_due_date` varchar(50) NOT NULL DEFAULT '- - -',
  `return_time` date DEFAULT NULL,
  `lending_status` enum('貸出可能','貸出中') NOT NULL,
  `evaluation` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- テーブルのデータのダンプ `lent`
--

INSERT INTO `lent` (`lent_id`, `book_id`, `user_id`, `lent_time`, `return_due_date`, `return_time`, `lending_status`, `evaluation`) VALUES
(51, 3, 2, '2023-07-25', '- - -', '2023-07-31', '貸出可能', 0),
(52, 3, 2, '2023-07-25', '- - -', '2023-07-31', '貸出可能', 0),
(53, 3, 2, '2023-07-25', '- - -', '2023-07-31', '貸出可能', 0),
(66, 6, 2, '2023-07-26', '- - -', '2023-08-02', '貸出可能', 0),
(67, 1, 2, '2023-07-27', '- - -', '2023-08-03', '貸出可能', 0),
(68, 4, 2, '2023-08-02', '- - -', '2023-08-28', '貸出可能', 0),
(69, 17, 2, '2023-08-02', '- - -', '2023-08-28', '貸出可能', 0),
(70, 1, 2, '2023-08-22', '2023-08-29', NULL, '貸出中', 0),
(71, 7, 2, '2023-08-22', '2023-08-29', NULL, '貸出中', 0),
(72, 2, 2, '2023-08-22', '2023-08-29', NULL, '貸出中', 0),
(73, 10, 2, '2023-08-22', '2023-08-29', NULL, '貸出中', 0),
(74, 14, 2, '2023-08-22', '2023-08-29', NULL, '貸出中', 0),
(75, 18, 3, '2023-08-22', '2023-08-29', NULL, '貸出中', 0),
(76, 12, 3, '2023-08-22', '2023-08-29', NULL, '貸出中', 0);

-- --------------------------------------------------------

--
-- ビュー用の代替構造 `lent2`
-- (実際のビューを参照するには下にあります)
--
CREATE TABLE `lent2` (
`lent_id` int
,`book_id` int
,`user_id` int
,`lent_time` date
,`return_due_date` varchar(50)
,`return_time` date
,`lending_status` enum('貸出可能','貸出中')
,`num` bigint unsigned
);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `affiliation_id` int DEFAULT NULL,
  `user_type_id` int DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`user_id`, `affiliation_id`, `user_type_id`, `user_name`, `password`) VALUES
(1, 1, 2, '須賀', 'sy8888'),
(2, 1, 1, '相川', 'as1207'),
(3, 1, 1, '植木', 'um1020'),
(4, 2, 2, '山本', 'ya9029'),
(5, 2, 1, '阿部', 'ay1092');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_type`
--

CREATE TABLE `user_type` (
  `user_type_id` int NOT NULL,
  `user_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- テーブルのデータのダンプ `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `user_type_name`) VALUES
(1, 'student'),
(2, 'teacher');

-- --------------------------------------------------------

--
-- ビュー用の構造 `book2`
--
DROP TABLE IF EXISTS `book2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `book2`  AS SELECT `book`.`ISBN` AS `ISBN`, row_number() OVER (ORDER BY `book`.`book_id` ) AS `num` FROM `book` ;

-- --------------------------------------------------------

--
-- ビュー用の構造 `lent2`
--
DROP TABLE IF EXISTS `lent2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lent2`  AS SELECT `subquery`.`lent_id` AS `lent_id`, `subquery`.`book_id` AS `book_id`, `subquery`.`user_id` AS `user_id`, `subquery`.`lent_time` AS `lent_time`, `subquery`.`return_due_date` AS `return_due_date`, `subquery`.`return_time` AS `return_time`, `subquery`.`lending_status` AS `lending_status`, `subquery`.`num` AS `num` FROM (select `lent`.`lent_id` AS `lent_id`,`lent`.`book_id` AS `book_id`,`lent`.`user_id` AS `user_id`,`lent`.`lent_time` AS `lent_time`,`lent`.`return_due_date` AS `return_due_date`,`lent`.`return_time` AS `return_time`,`lent`.`lending_status` AS `lending_status`,row_number() OVER (PARTITION BY `lent`.`book_id` ORDER BY `lent`.`lent_id` desc )  AS `num` from `lent`) AS `subquery` WHERE (`subquery`.`num` = 1) ;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `affiliation`
--
ALTER TABLE `affiliation`
  ADD PRIMARY KEY (`affiliation_id`),
  ADD UNIQUE KEY `affilication_name` (`affiliation_name`);

--
-- テーブルのインデックス `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `affilication_id` (`affiliation_id`);

--
-- テーブルのインデックス `images`
--
ALTER TABLE `images`
  ADD UNIQUE KEY `image_pass` (`image_pass`);

--
-- テーブルのインデックス `lent`
--
ALTER TABLE `lent`
  ADD PRIMARY KEY (`lent_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `affilication_id` (`affiliation_id`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- テーブルのインデックス `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`user_type_id`),
  ADD UNIQUE KEY `user_type_name` (`user_type_name`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `affiliation`
--
ALTER TABLE `affiliation`
  MODIFY `affiliation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- テーブルの AUTO_INCREMENT `lent`
--
ALTER TABLE `lent`
  MODIFY `lent_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliation` (`affiliation_id`);

--
-- テーブルの制約 `lent`
--
ALTER TABLE `lent`
  ADD CONSTRAINT `lent_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `lent_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- テーブルの制約 `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliation` (`affiliation_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
