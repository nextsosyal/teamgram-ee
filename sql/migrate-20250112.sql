-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2025-01-12 08:33:01
-- 服务器版本： 8.0.28
-- PHP 版本： 8.3.13

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
-- 表的结构 `premium_subscription_options`
--

CREATE TABLE `premium_subscription_options` (
  `id` int NOT NULL,
  `store_product` varchar(128) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `can_purchase_upgrade` tinyint(1) NOT NULL DEFAULT '0',
  `transaction` varchar(128) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `months` int NOT NULL,
  `currency` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` bigint NOT NULL,
  `bot_url` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `premium_subscription_options`
--

INSERT INTO `premium_subscription_options` (`id`, `store_product`, `can_purchase_upgrade`, `transaction`, `months`, `currency`, `amount`, `bot_url`, `created_at`, `updated_at`) VALUES
(2, 'org.telegram.telegramPremium.monthly', 0, '', 1, 'CNY', 2899, 'https://t.me/PremiumBot?start=1', '2025-01-08 12:46:50', '2025-01-08 12:46:50'),
(3, 'org.telegram.telegramPremium.annual', 0, '', 12, 'CNY', 20999, 'https://t.me/PremiumBot?start=12', '2025-01-08 12:46:50', '2025-01-09 07:17:46');

--
-- 转储表的索引
--

--
-- 表的索引 `premium_subscription_options`
--
ALTER TABLE `premium_subscription_options`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `premium_subscription_options`
--
ALTER TABLE `premium_subscription_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
