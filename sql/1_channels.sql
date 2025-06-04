-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 11:21:08
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
-- 转存表中的数据 `channels`
--

INSERT INTO `channels` (`id`, `creator_user_id`, `access_hash`, `secret_key_id`, `random_id`, `top_message`, `pinned_msg_id`, `date2`, `pts`, `participants_count`, `admins_count`, `kicked_count`, `banned_count`, `title`, `about`, `photo_id`, `username`, `broadcast`, `verified`, `megagroup`, `gigagroup`, `noforwards`, `join_to_send`, `join_request`, `signatures`, `scam`, `fake`, `forum`, `default_banned_rights`, `migrated_from_chat_id`, `pre_history_hidden`, `has_link`, `linked_chat_id`, `available_reactions_type`, `available_reactions`, `slowmode_enabled`, `slowmode_start_date`, `deactivated`, `restrictions`, `ttl_period`, `version`, `date`, `color`, `color_background_emoji_id`, `profile_color`, `profile_color_background_emoji_id`, `emoji_status_document_id`, `emoji_status_until`, `level`, `deleted`, `created_at`, `updated_at`) VALUES
(1073801838, 136907704, 901080434650096999, -5416293426887017748, 7035914583482233268, 23, 0, 1646892966, 24, 5, 1, 0, 0, 'Teamgram Tips', 'Teamgram stands for freedom and privacy and has many easy to use features.', 0, 'TeamgramTips', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 16, 1646893015, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-29 09:02:01', '2022-03-10 06:16:55'),
(1073801866, 136907703, 2225317008011325227, -7343759872722444095, 7045946153691417604, 1114, 0, 1640518249, 1115, 1, 1, 0, 0, 'tdhbcfiles', '', 0, 'tdhbcfiles', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 2, 1640512184, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-26 09:49:37', '2021-12-26 11:30:49');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
