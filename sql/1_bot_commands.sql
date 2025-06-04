-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 11:06:21
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
-- 转存表中的数据 `bot_commands`
--

INSERT INTO `bot_commands` (`id`, `bot_id`, `command`, `description`, `created_at`, `updated_at`) VALUES
(1, 6, 'newbot', 'create a new bot', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(2, 6, 'mybots', 'edit your bots [beta]', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(3, 6, 'mygames', 'edit your games [beta]', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(4, 6, 'token', 'generate authorization token', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(5, 6, 'revoke', 'revoke bot access token', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(6, 6, 'setname', 'change a bot\'s name', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(7, 6, 'setdescription', 'change bot description', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(8, 6, 'setabouttext', 'change bot about info', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(9, 6, 'setuserpic', 'change bot profile photo', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(10, 6, 'setinline', 'change inline settings', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(11, 6, 'setinlinegeo', 'toggle inline location requests', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(12, 6, 'setinlinefeedback', 'change inline feedback settings', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(13, 6, 'setcommands', 'change bot commands list', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(14, 6, 'setjoingroups', 'can your bot be added to groups?', '2018-11-19 07:32:11', '2021-12-22 14:02:01'),
(15, 6, 'setdomain', 'link website\'s domain to the bot', '2018-11-19 07:32:11', '2021-12-22 14:02:01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
