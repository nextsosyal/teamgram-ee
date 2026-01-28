-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 10:48:39
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
-- 转存表中的数据 `bots`
--

INSERT INTO `bots` (`id`, `bot_id`, `bot_type`, `creator_user_id`, `token`, `description`, `bot_chat_history`, `bot_nochats`, `verified`, `bot_inline_geo`, `bot_info_version`, `bot_inline_placeholder`, `bot_attach_menu`, `attach_menu_enabled`, `bot_business`, `bot_has_main_app`, `bot_active_users`, `created_at`, `updated_at`) VALUES
(1, 6, 0, 0, 'aZYUYx2PO0vCQKS6eUY6u4IcpvoImZMtHr4', 'BotFather is the one bot to rule them all. Use it to create new bot accounts and manage your existing bots.\r\n\r\nAbout Telegram bots:\r\nhttps://core.telegram.org/bots\r\nBot API manual:\r\nhttps://core.telegram.org/bots/api\r\n\r\nContact @BotSupport if you have questions about the Bot API.', 0, 1, 1, 0, 1, '', 0, 0, 0, 0, 0, '2018-11-19 07:17:52', '2021-09-03 09:40:10'),
(6, 136817688, 0, 0, 'Ai8BUyhcOWburm0ODhwLQ9BldcatNWY8Laa', '', 0, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:10'),
(7, 101, 0, 0, '101:YPT3TNGsBdGPyZk8cJP7CTQ6OHcvFh59lgm', 'This GIF search bot automatically works in all your chats and groups, no need to add it anywhere. Simply type @gif in any chat, then type your query (without hitting \'send\'). This will open a panel with GIF suggestions. Tap on a GIF to send it to your chat partner right away.', 0, 1, 0, 0, 1, 'Search GIFs', 0, 0, 0, 0, 0, '2019-06-30 13:07:33', '2021-09-03 09:40:10'),
(12, 103, 0, 0, 'GLKpl5YaCX86x1iIh1JVowYf5on7iDL4npd', 'This bot can help you find and share images. It works automatically, no need to add it anywhere. Simply open any of your chats and type @pic something in the message field. Then tap on a result to send.\\n\\nFor example, try typing @pic funny cat here.', 0, 1, 0, 0, 1, 'Search Images', 0, 0, 0, 0, 0, '2019-06-30 13:07:33', '2021-09-03 09:40:10'),
(13, 136917737, 0, 136877695, 'vU4iikqBuP5nWbYW8GLroUUMnbF4KW5Bt8x', '', 1, 0, 0, 0, 1, '', 0, 0, 0, 0, 0, '2022-09-24 10:05:09', '2023-07-08 14:22:50'),
(14, 1271266957, 0, 0, 'Ai8BUyhcOWburm0ODhwLQ9BldcatNWY8Lab', '', 0, 1, 0, 0, 3, '', 0, 0, 0, 0, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:10'),
(15, 1087968824, 0, 0, 'Ai8BUyhcOWburm0ODhwLQ9BldcatNWY8Lac', 'This user is an anonymous admin in this group. Update your app to version 7.1+ to use this feature.', 0, 1, 0, 0, 3, '', 0, 0, 0, 0, 0, '2020-03-04 02:14:26', '2021-09-03 09:40:10'),
(16, 110, 0, 0, 'YPT3TNGsBdGPyZk8cJP7CTQ6OHcvFh59lgx', 'This bot can help you find restaurants and other places nearby and send their addresses to friends.', 0, 0, 0, 1, 3, 'pizza near New York', 0, 0, 0, 0, 0, '2019-06-30 13:07:33', '2023-04-14 00:07:55');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
