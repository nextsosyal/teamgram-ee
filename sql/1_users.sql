-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 11:24:19
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
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `user_type`, `access_hash`, `secret_key_id`, `first_name`, `last_name`, `username`, `phone`, `country_code`, `verified`, `support`, `scam`, `fake`, `premium`, `about`, `state`, `is_bot`, `account_days_ttl`, `photo_id`, `restricted`, `restriction_reason`, `archive_and_mute_new_noncontact_peers`, `emoji_status_document_id`, `emoji_status_until`, `stories_max_id`, `color`, `color_background_emoji_id`, `profile_color`, `profile_color_background_emoji_id`, `birthday`, `personal_channel_id`, `deleted`, `delete_reason`, `created_at`, `updated_at`) VALUES
(6, 3, 6599886787491911851, 6895602324158323006, 'BotFather', '', 'BotFather', '', '', 1, 0, 0, 0, 0, 'BotFather is the one bot to rule them all. Use it to create new bot accounts and manage your existing bots.', 0, 1, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2018-09-25 13:43:11', '2021-11-16 07:38:30'),
(101, 3, 5577006791947779410, 6895602324158323006, 'Giphy GIF Search', '', 'gif', 'gif', '', 1, 0, 0, 0, 0, '', 0, 1, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2018-09-25 13:43:11', '2021-11-16 07:38:34'),
(103, 3, 5577006791947779411, -2703888282207967805, 'Yandex Image Search', '', 'pic', 'pic', '', 0, 0, 0, 0, 0, '', 0, 1, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2018-09-25 13:43:11', '2021-11-16 07:38:37'),
(110, 3, 5577006791947779410, 6895602324158323006, 'Foursquare', '', 'foursquare', 'foursquare', '', 1, 0, 0, 0, 0, '', 0, 1, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2018-09-25 13:43:11', '2023-04-14 00:05:54'),
(424000, 5, 6599886787491911852, 6254072413654335478, 'Volunteer Support', '', '', '42400', 'CN', 1, 1, 0, 0, 0, '', 0, 0, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2018-09-25 13:43:11', '2022-12-09 11:26:52'),
(424001, 5, 6599886787491911852, 6254072413654335478, 'Volunteer Support', '', '', '42401', 'CN', 1, 1, 0, 0, 0, '', 0, 0, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2018-09-25 13:43:11', '2022-12-09 11:26:56'),
(777000, 4, 6599886787491911851, 6895602324158323006, 'Tekir', '', 'tekir', '42777', '', 1, 0, 0, 0, 0, '', 0, 0, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2018-09-25 13:43:11', '2021-12-17 12:40:51'),
(777001, 5, 5427553650953695413, 48129949631596502, 't777001', '', '', '-777001', 'CN', 0, 0, 0, 0, 0, '', 0, 0, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2023-06-02 15:25:13', '2023-06-02 15:25:13'),
(777002, 5, 8142134921362956849, -3851402977407975560, 't777002', '', '', '-777002', 'CN', 0, 0, 0, 0, 0, '', 0, 0, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2023-06-02 15:25:13', '2023-06-02 15:25:13');

INSERT INTO `users` (`id`, `user_type`, `access_hash`, `secret_key_id`, `first_name`, `last_name`, `username`, `phone`, `country_code`, `verified`, `support`, `scam`, `fake`, `premium`, `about`, `state`, `is_bot`, `account_days_ttl`, `photo_id`, `restricted`, `restriction_reason`, `archive_and_mute_new_noncontact_peers`, `emoji_status_document_id`, `emoji_status_until`, `stories_max_id`, `color`, `color_background_emoji_id`, `profile_color`, `profile_color_background_emoji_id`, `birthday`, `personal_channel_id`, `deleted`, `delete_reason`, `created_at`, `updated_at`) VALUES
(1271266957, 3, 1608569208773884879, 117013984796508050, 'Replies', '', 'replies', 'replies', 'CN', 0, 0, 0, 0, 0, 'This user is an anonymous admin in this group. Update your app to version 7.1+ to use this feature.', 0, 1, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2020-03-04 02:14:26', '2023-02-26 00:18:49');

INSERT INTO `users` (`id`, `user_type`, `access_hash`, `secret_key_id`, `first_name`, `last_name`, `username`, `phone`, `country_code`, `verified`, `support`, `scam`, `fake`, `premium`, `about`, `state`, `is_bot`, `account_days_ttl`, `photo_id`, `restricted`, `restriction_reason`, `archive_and_mute_new_noncontact_peers`, `emoji_status_document_id`, `emoji_status_until`, `stories_max_id`, `color`, `color_background_emoji_id`, `profile_color`, `profile_color_background_emoji_id`, `birthday`, `personal_channel_id`, `deleted`, `delete_reason`, `created_at`, `updated_at`) VALUES
(1087968824, 3, 4034400794978209154, 117013984796508050, 'Group', '', 'GroupAnonymousBot', 'GroupAnonymousBot', 'CN', 0, 0, 0, 0, 0, '', 0, 1, 180, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', '2020-03-04 02:14:26', '2021-11-16 07:40:03');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
