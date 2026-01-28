-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2025-04-15 19:37:59
-- 服务器版本： 8.0.41
-- PHP 版本： 8.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `teamgram`
--

-- --------------------------------------------------------

--
-- 表的结构 `saved_reactions`
--

CREATE TABLE IF NOT EXISTS `saved_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `saved_peer_type` int NOT NULL,
  `saved_peer_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `reaction` varchar(32) NOT NULL,
  `big` tinyint(1) NOT NULL DEFAULT '0',
  `chosen_order` int NOT NULL,
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`user_message_box_id`,`chosen_order`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `tag_reactions`
--

CREATE TABLE IF NOT EXISTS `tag_reactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reaction` varchar(32) NOT NULL,
  `default2` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`reaction`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `tag_reactions`
--

INSERT INTO `tag_reactions` (`id`, `reaction`, `default2`, `created_at`) VALUES
(1, '5435957248314579621', 1, '2025-04-10 14:03:59'),
(2, '5470060791883374114', 1, '2025-04-10 14:03:59'),
(3, '5472146462362048818', 1, '2025-04-10 14:03:59'),
(4, '5431897022456145283', 1, '2025-04-10 14:03:59'),
(5, '5420315771991497307', 1, '2025-04-10 14:03:59'),
(6, '5431449001532594346', 1, '2025-04-10 14:03:59'),
(7, '5433982607035474385', 1, '2025-04-10 14:03:59'),
(8, '5467666648263564704', 1, '2025-04-10 14:03:59'),
(9, '5373052667671093676', 1, '2025-04-10 14:03:59'),
(10, '5361600266225326825', 1, '2025-04-10 14:03:59'),
(11, '5373330964372004748', 1, '2025-04-10 14:03:59'),
(12, '5371074117971745503', 1, '2025-04-10 14:03:59'),
(13, '5359785904535774578', 1, '2025-04-10 14:03:59'),
(14, '5373098009640836781', 1, '2025-04-10 14:03:59'),
(15, '5431721976769027887', 1, '2025-04-10 14:03:59'),
(16, '5427009714745517609', 1, '2025-04-10 14:03:59');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
