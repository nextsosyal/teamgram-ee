-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 11:23:28
-- 服务器版本： 8.0.28
-- PHP 版本： 8.3.11

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

--
-- 转存表中的数据 `username`
--

INSERT INTO `username` (`id`, `username`, `peer_type`, `peer_id`, `deleted`, `created_at`, `updated_at`) VALUES
(135, 'BotFather', 2, 6, 0, '2019-10-31 14:24:52', '2021-09-03 09:40:15'),
(141, 'gif', 2, 101, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:15'),
(143, 'Channel_Bot', 2, 136817688, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:15'),
(148, 'pic', 2, 103, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:15'),
(90172, 'TeamgramTips', 4, 1073801838, 0, '2021-12-16 01:07:55', '2021-12-16 01:07:55'),
(90180, 'tdhbcfiles', 4, 1073801866, 0, '2021-12-26 09:49:44', '2021-12-26 09:49:44'),
(90225, 'Replies', 2, 1271266957, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:15'),
(90226, 'GroupAnonymousBot', 2, 1087968824, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:15');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
