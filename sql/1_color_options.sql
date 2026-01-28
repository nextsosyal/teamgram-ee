-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 11:34:43
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
-- 转存表中的数据 `color_options`
--

INSERT INTO `color_options` (`id`, `color_id`, `is_profile`, `hidden`, `colors`, `dark_colors`, `channel_min_level`, `created_at`) VALUES
(1, 5, 0, 0, '', '', 1, '2024-01-10 14:14:18'),
(2, 3, 0, 0, '', '', 1, '2024-01-10 14:14:18'),
(3, 1, 0, 0, '', '', 1, '2024-01-10 14:14:18'),
(4, 0, 0, 0, '', '', 1, '2024-01-10 14:14:18'),
(5, 2, 0, 0, '', '', 1, '2024-01-10 14:14:18'),
(6, 4, 0, 0, '', '', 1, '2024-01-10 14:14:18'),
(7, 6, 0, 0, '', '', 1, '2024-01-10 14:14:18'),
(8, 12, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[3379668,8246256]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[3379668,8246256]}', 2, '2024-01-10 14:14:18'),
(9, 10, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2599184,11000919]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2599184,11000919]}', 2, '2024-01-10 14:14:18'),
(10, 8, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14712875,16434484]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14712875,16434484]}', 2, '2024-01-10 14:14:18'),
(11, 7, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14766162,16363107]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14766162,16363107]}', 2, '2024-01-10 14:14:18'),
(12, 9, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[10510323,16027647]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[10510323,16027647]}', 2, '2024-01-10 14:14:18'),
(13, 11, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2600142,8579286]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2600142,8579286]}', 2, '2024-01-10 14:14:18'),
(14, 13, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14500721,16760479]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14500721,16760479]}', 2, '2024-01-10 14:14:18'),
(15, 14, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2391021,15747158,16777215]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2391021,15747158,16777215]}', 3, '2024-01-10 14:14:18'),
(16, 15, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14055202,2007057,16777215]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[14055202,2007057,16777215]}', 3, '2024-01-10 14:14:18'),
(17, 16, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[1547842,15223359,16777215]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[1547842,15223359,16777215]}', 3, '2024-01-10 14:14:18'),
(18, 17, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2659503,7324758,16777215]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[2659503,7324758,16777215]}', 3, '2024-01-10 14:14:18'),
(19, 18, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[826035,16756117,16770741]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[826035,16756117,16770741]}', 3, '2024-01-10 14:14:18'),
(20, 19, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[7821270,16225808,16768654]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[7821270,16225808,16768654]}', 3, '2024-01-10 14:14:18'),
(21, 20, 0, 0, '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[1410511,15903517,16777215]}', '{\"predicate_name\":\"help_peerColorSet\",\"constructor\":639736408,\"colors\":[1410511,15903517,16777215]}', 3, '2024-01-10 14:14:18'),
(22, 5, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[4888278],\"bg_colors\":[5935035],\"story_colors\":[7264511,7405535]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[4888278],\"bg_colors\":[5935035],\"story_colors\":[7264511,7405535]}', 5, '2024-01-10 14:14:18'),
(23, 3, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[5485111],\"bg_colors\":[4825941],\"story_colors\":[7991418,13299018]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[5485111],\"bg_colors\":[4825941],\"story_colors\":[7991418,13299018]}', 5, '2024-01-10 14:14:18'),
(24, 1, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[14386489],\"bg_colors\":[12745790],\"story_colors\":[16756531,16240230]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[14386489],\"bg_colors\":[12745790],\"story_colors\":[16756531,16240230]}', 5, '2024-01-10 14:14:18'),
(25, 0, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[13722204],\"bg_colors\":[12211792],\"story_colors\":[16752253,16758622]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[13722204],\"bg_colors\":[12211792],\"story_colors\":[16752253,16758622]}', 5, '2024-01-10 14:14:18'),
(26, 2, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[10513887],\"bg_colors\":[9792200],\"story_colors\":[16030463,16753387]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[10513887],\"bg_colors\":[9792200],\"story_colors\":[16030463,16753387]}', 5, '2024-01-10 14:14:18'),
(27, 4, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[4565185],\"bg_colors\":[4102061],\"story_colors\":[5036799,4325314]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[4565185],\"bg_colors\":[4102061],\"story_colors\":[5036799,4325314]}', 5, '2024-01-10 14:14:18'),
(28, 6, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[13460119],\"bg_colors\":[12079992],\"story_colors\":[16746153,16754323]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[13460119],\"bg_colors\":[12079992],\"story_colors\":[16746153,16754323]}', 5, '2024-01-10 14:14:18'),
(29, 7, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[9477803],\"bg_colors\":[8358805],\"story_colors\":[12834019,15726847]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[9477803],\"bg_colors\":[8358805],\"story_colors\":[12834019,15726847]}', 5, '2024-01-10 14:14:18'),
(30, 13, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[3574481,8246256],\"bg_colors\":[5475266,5089469],\"story_colors\":[7264511,7405535]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[3574481,8246256],\"bg_colors\":[5475266,5089469],\"story_colors\":[7264511,7405535]}', 6, '2024-01-10 14:14:18'),
(31, 11, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[2599184,11000919],\"bg_colors\":[4036437,9021008],\"story_colors\":[7991418,13299018]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[2599184,11000919],\"bg_colors\":[4036437,9021008],\"story_colors\":[7991418,13299018]}', 6, '2024-01-10 14:14:18'),
(32, 9, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[14712875,15842348],\"bg_colors\":[13595204,13407283],\"story_colors\":[16756531,16240230]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[14712875,15842348],\"bg_colors\":[13595204,13407283],\"story_colors\":[16756531,16240230]}', 6, '2024-01-10 14:14:18'),
(33, 8, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[14966882,16363107],\"bg_colors\":[13194845,14253143],\"story_colors\":[16752253,16758622]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[14966882,16363107],\"bg_colors\":[13194845,14253143],\"story_colors\":[16752253,16758622]}', 6, '2024-01-10 14:14:18'),
(34, 10, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[10510323,16027647],\"bg_colors\":[9855700,12150454],\"story_colors\":[16030463,16753387]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[10510323,16027647],\"bg_colors\":[9855700,12150454],\"story_colors\":[16030463,16753387]}', 6, '2024-01-10 14:14:18'),
(35, 12, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[2600142,9234906],\"bg_colors\":[4036026,5287320],\"story_colors\":[5036799,4325314]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[2600142,9234906],\"bg_colors\":[4036026,5287320],\"story_colors\":[5036799,4325314]}', 6, '2024-01-10 14:14:18'),
(36, 14, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[13715826,16760479],\"bg_colors\":[11554676,13723245],\"story_colors\":[16746153,16754323]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[13715826,16760479],\"bg_colors\":[11554676,13723245],\"story_colors\":[16746153,16754323]}', 6, '2024-01-10 14:14:18'),
(37, 15, 1, 0, '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[7108740,11384769],\"bg_colors\":[6517890,8096407],\"story_colors\":[12834019,15726847]}', '{\"predicate_name\":\"help_peerColorProfileSet\",\"constructor\":1987928555,\"palette_colors\":[7108740,11384769],\"bg_colors\":[6517890,8096407],\"story_colors\":[12834019,15726847]}', 6, '2024-01-10 14:14:18');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
