-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 10:55:41
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
-- 转存表中的数据 `languages`
--

INSERT INTO `languages` (`id`, `lang_code`, `base_lang_code`, `link`, `official`, `rtl`, `beta`, `name`, `native_name`, `plural_code`, `translations_url`, `state`, `created_at`, `updated_at`) VALUES
(1, 'en', '', 'en', 1, 0, 0, 'English', 'English', 'en', 'https://translations.telegram.org/en/', 0, '2020-03-09 02:22:08', '2021-09-03 09:40:11'),
(2, 'ca', '', 'ca', 1, 0, 0, 'Catalan', 'Català', 'ca', 'https://translations.telegram.org/ca/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:05'),
(3, 'nl', '', 'nl', 1, 0, 0, 'Dutch', 'Nederlands', 'nl', 'https://translations.telegram.org/nl/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:08'),
(4, 'fr', '', 'fr', 1, 0, 0, 'French', 'Français', 'fr', 'https://translations.telegram.org/fr/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:09'),
(5, 'de', '', 'de', 1, 0, 0, 'German', 'Deutsch', 'de', 'https://translations.telegram.org/de/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:10'),
(6, 'it', '', 'it', 1, 0, 0, 'Italian', 'Italiano', 'it', 'https://translations.telegram.org/it/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:11'),
(7, 'ko-raw', '', 'ko-beta', 0, 0, 1, 'Korean', '한국어', 'ko', 'https://translations.telegram.org/ko/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:13'),
(8, 'ms', '', 'ms', 1, 0, 0, 'Malay', 'Bahasa Melayu', 'ms', 'https://translations.telegram.org/ms/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:14'),
(9, 'pt-br', '', 'pt-br', 1, 0, 0, 'Portuguese (Brazil)', 'Português (Brasil)', 'pt', 'https://translations.telegram.org/pt-br/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:18'),
(10, 'ru', '', 'ru', 1, 0, 0, 'Russian', 'Русский', 'ru', 'https://translations.telegram.org/ru/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:19'),
(11, 'es', '', 'es', 1, 0, 0, 'Spanish', 'Español', 'es', 'https://translations.telegram.org/es/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:20'),
(12, 'tr', '', 'tr', 1, 0, 0, 'Turkish', 'Türkçe', 'tr', 'https://translations.telegram.org/tr/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:21'),
(13, 'ur', '', 'ur', 1, 0, 0, 'Ukrainian', 'Українська', 'ur', 'https://translations.telegram.org/ur/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:29'),
(14, 'zh-hans-raw', '', 'zh-hans-beta', 0, 0, 1, 'Chinese (Simplified)', '简体中文 (beta)', 'zh', 'https://translations.telegram.org/zh-hans/', 2, '2020-03-09 02:22:08', '2021-09-03 09:40:11'),
(15, 'classic-zh-cn', 'zh-hans-raw', 'classic-zh-cn', 0, 0, 0, 'Chinese (Simplified, @zh_CN)', '简体中文 (@zh_CN 版)', 'zh', 'https://translations.telegram.org/classic-zh-cn/', 0, '2020-03-09 02:22:08', '2022-02-21 07:02:56'),
(17, 'ar-raw', '', 'ar-beta', 0, 1, 1, 'Arabic', 'العربية (beta)', 'ar', 'https://translations.telegram.org/ar/', 1, '2020-03-09 02:22:08', '2021-12-17 15:14:38'),
(18, 'zh-hant-raw', '', 'zh-hant-beta', 0, 0, 1, 'Chinese (Traditional)', '繁體中文 (beta)', 'zh', 'https://translations.telegram.org/zh-hant/', 1, '2020-05-11 02:22:08', '2022-02-21 06:00:19'),
(19, 'fa-raw', '', 'fa-beta', 0, 1, 1, 'Persian', 'فارسی (beta)', 'fa', 'https://translations.telegram.org/fa/', 0, '2020-05-11 02:22:08', '2022-02-21 06:00:21');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
