-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-11-04 10:34:22
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

-- --------------------------------------------------------

--
-- 表的结构 `apps`
--

CREATE TABLE IF NOT EXISTS `apps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `api_id` int NOT NULL,
  `api_hash` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_id` (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='apps';

-- --------------------------------------------------------

--
-- 表的结构 `app_configs`
--

CREATE TABLE IF NOT EXISTS `app_configs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_type` int NOT NULL DEFAULT '0',
  `key2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type2` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `value2` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_type` (`client_type`,`key2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `app_languages`
--

CREATE TABLE IF NOT EXISTS `app_languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int NOT NULL,
  `strings_count` int NOT NULL DEFAULT '0',
  `translated_count` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app` (`app`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `app_logs`
--

CREATE TABLE IF NOT EXISTS `app_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `auth_id` bigint NOT NULL,
  `type2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time2` bigint NOT NULL,
  `peer` bigint NOT NULL,
  `data` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`auth_id`,`type2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `app_updates`
--

CREATE TABLE IF NOT EXISTS `app_updates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `can_not_skip` tinyint(1) NOT NULL DEFAULT '0',
  `update_id` int NOT NULL,
  `version` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `text` varchar(4096) COLLATE utf8mb4_general_ci NOT NULL,
  `document` bigint NOT NULL DEFAULT '0',
  `url` varchar(256) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `sticker` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app` (`app`,`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auths`
--

CREATE TABLE IF NOT EXISTS `auths` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_key_id` bigint NOT NULL,
  `layer` int NOT NULL DEFAULT '0',
  `api_id` int NOT NULL DEFAULT '0',
  `device_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `system_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `app_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `system_lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang_pack` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `system_code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `proxy` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` json NOT NULL,
  `client_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date_active` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_key_id` (`auth_key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_keys`
--

CREATE TABLE IF NOT EXISTS `auth_keys` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_key_id` bigint NOT NULL COMMENT 'auth_id',
  `body` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'auth_key，原始数据为256的二进制数据，存储时转换成base64格式',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_key_id` (`auth_key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_key_infos`
--

CREATE TABLE IF NOT EXISTS `auth_key_infos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_key_id` bigint NOT NULL,
  `auth_key_type` int NOT NULL,
  `perm_auth_key_id` bigint NOT NULL DEFAULT '0',
  `temp_auth_key_id` bigint NOT NULL DEFAULT '0',
  `media_temp_auth_key_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_key_id` (`auth_key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_op_logs`
--

CREATE TABLE IF NOT EXISTS `auth_op_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_key_id` bigint NOT NULL,
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `op_type` int NOT NULL DEFAULT '1',
  `log_text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_seq_updates`
--

CREATE TABLE IF NOT EXISTS `auth_seq_updates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `seq` int NOT NULL DEFAULT '0',
  `update_type` int NOT NULL DEFAULT '0',
  `update_data` json NOT NULL,
  `date2` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_id` (`auth_id`,`user_id`,`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_updates_states`
--

CREATE TABLE IF NOT EXISTS `auth_updates_states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `last_pts` int NOT NULL DEFAULT '0',
  `qts` int NOT NULL DEFAULT '0',
  `last_qts` int NOT NULL DEFAULT '0',
  `seq` int NOT NULL DEFAULT '0',
  `last_seq` int NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `last_date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_id` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `auth_users`
--

CREATE TABLE IF NOT EXISTS `auth_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_key_id` bigint NOT NULL,
  `user_id` bigint NOT NULL DEFAULT '0',
  `hash` bigint NOT NULL DEFAULT '0',
  `layer` int NOT NULL DEFAULT '0',
  `device_model` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `system_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `api_id` int NOT NULL DEFAULT '0',
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `app_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date_created` bigint NOT NULL DEFAULT '0',
  `date_actived` bigint NOT NULL DEFAULT '0',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `region` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_key_id` (`auth_key_id`,`user_id`),
  KEY `auth_key_id_2` (`auth_key_id`,`user_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `banned`
--

CREATE TABLE IF NOT EXISTS `banned` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banned_time` bigint NOT NULL,
  `expires` bigint NOT NULL DEFAULT '0',
  `banned_reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `log` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `bots`
--

CREATE TABLE IF NOT EXISTS `bots` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bot_id` bigint NOT NULL,
  `bot_type` int NOT NULL DEFAULT '0',
  `creator_user_id` bigint NOT NULL DEFAULT '0',
  `token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bot_chat_history` tinyint(1) NOT NULL DEFAULT '0',
  `bot_nochats` tinyint(1) NOT NULL DEFAULT '1',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `bot_inline_geo` tinyint(1) NOT NULL DEFAULT '0',
  `bot_info_version` int NOT NULL DEFAULT '1',
  `bot_inline_placeholder` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bot_attach_menu` tinyint(1) NOT NULL DEFAULT '0',
  `attach_menu_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `bot_business` tinyint(1) NOT NULL DEFAULT '0',
  `bot_has_main_app` tinyint(1) NOT NULL DEFAULT '0',
  `bot_active_users` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bot_id` (`bot_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `bot_commands`
--

CREATE TABLE IF NOT EXISTS `bot_commands` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bot_id` bigint NOT NULL,
  `command` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bot_id` (`bot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `bot_updates`
--

CREATE TABLE IF NOT EXISTS `bot_updates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bot_id` bigint NOT NULL,
  `update_id` bigint NOT NULL,
  `update_type` int NOT NULL,
  `update_data` json NOT NULL,
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bot_id` (`bot_id`,`update_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `bot_updates_states`
--

CREATE TABLE IF NOT EXISTS `bot_updates_states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bot_id` bigint NOT NULL,
  `update_id` bigint NOT NULL DEFAULT '0',
  `last_update_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bot_id` (`bot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creator_user_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `secret_key_id` bigint NOT NULL DEFAULT '0',
  `random_id` bigint NOT NULL,
  `top_message` int NOT NULL DEFAULT '0',
  `pinned_msg_id` int NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `pts` int NOT NULL DEFAULT '0',
  `participants_count` int NOT NULL DEFAULT '0',
  `admins_count` int NOT NULL DEFAULT '0',
  `kicked_count` int NOT NULL DEFAULT '0',
  `banned_count` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `photo_id` bigint NOT NULL DEFAULT '0',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `broadcast` tinyint(1) NOT NULL DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `megagroup` tinyint(1) NOT NULL DEFAULT '0',
  `gigagroup` tinyint(1) NOT NULL DEFAULT '0',
  `noforwards` tinyint(1) NOT NULL DEFAULT '0',
  `join_to_send` tinyint(1) NOT NULL DEFAULT '0',
  `join_request` tinyint(1) NOT NULL DEFAULT '0',
  `signatures` tinyint(1) NOT NULL DEFAULT '0',
  `scam` tinyint(1) NOT NULL DEFAULT '0',
  `fake` tinyint(1) NOT NULL DEFAULT '0',
  `forum` tinyint(1) NOT NULL DEFAULT '0',
  `default_banned_rights` bigint NOT NULL DEFAULT '0',
  `migrated_from_chat_id` bigint NOT NULL DEFAULT '0',
  `pre_history_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `has_link` tinyint(1) NOT NULL DEFAULT '0',
  `linked_chat_id` bigint NOT NULL DEFAULT '0',
  `available_reactions_type` int NOT NULL DEFAULT '0',
  `available_reactions` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slowmode_enabled` int NOT NULL DEFAULT '0',
  `slowmode_start_date` bigint NOT NULL DEFAULT '0',
  `deactivated` tinyint(1) NOT NULL DEFAULT '0',
  `restrictions` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ttl_period` int NOT NULL DEFAULT '0',
  `version` int NOT NULL DEFAULT '1',
  `date` bigint NOT NULL DEFAULT '0',
  `color` int NOT NULL DEFAULT '0',
  `color_background_emoji_id` bigint NOT NULL DEFAULT '0',
  `profile_color` int NOT NULL DEFAULT '0',
  `profile_color_background_emoji_id` bigint NOT NULL DEFAULT '0',
  `emoji_status_document_id` bigint NOT NULL DEFAULT '0',
  `emoji_status_until` int NOT NULL DEFAULT '0',
  `level` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `creator_user_id_3` (`creator_user_id`,`access_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_admin_logs`
--

CREATE TABLE IF NOT EXISTS `channel_admin_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `channel_id` bigint NOT NULL,
  `event` int NOT NULL,
  `event_data` json NOT NULL,
  `query` varchar(5096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  KEY `user_id` (`user_id`,`channel_id`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_hash_tags`
--

CREATE TABLE IF NOT EXISTS `channel_hash_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `hash_tag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash_tag_message_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_id_2` (`channel_id`,`hash_tag`,`hash_tag_message_id`),
  KEY `channel_id` (`channel_id`,`hash_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_invites`
--

CREATE TABLE IF NOT EXISTS `channel_invites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `link` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_type` int NOT NULL DEFAULT '0',
  `permanent` tinyint(1) NOT NULL DEFAULT '0',
  `revoked` tinyint(1) NOT NULL DEFAULT '0',
  `request_needed` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` bigint NOT NULL DEFAULT '0',
  `expire_date` bigint NOT NULL DEFAULT '0',
  `usage_limit` int NOT NULL DEFAULT '0',
  `usage2` int NOT NULL DEFAULT '0',
  `requested` int NOT NULL DEFAULT '0',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date2` bigint NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `channel_id` (`channel_id`),
  KEY `channel_id_2` (`channel_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_invite_participants`
--

CREATE TABLE IF NOT EXISTS `channel_invite_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `link` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `approved_by` bigint NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`,`user_id`),
  KEY `link_2` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages`
--

CREATE TABLE IF NOT EXISTS `channel_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(8096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`),
  KEY `channel_id_2` (`channel_id`,`deleted`),
  KEY `channel_id_3` (`channel_id`,`reply_to_top_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_0`
--

CREATE TABLE IF NOT EXISTS `channel_messages_0` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_1`
--

CREATE TABLE IF NOT EXISTS `channel_messages_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_2`
--

CREATE TABLE IF NOT EXISTS `channel_messages_2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_3`
--

CREATE TABLE IF NOT EXISTS `channel_messages_3` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_4`
--

CREATE TABLE IF NOT EXISTS `channel_messages_4` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_5`
--

CREATE TABLE IF NOT EXISTS `channel_messages_5` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_6`
--

CREATE TABLE IF NOT EXISTS `channel_messages_6` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_7`
--

CREATE TABLE IF NOT EXISTS `channel_messages_7` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `pts` int NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `thread_id` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `comment_group_id` bigint NOT NULL DEFAULT '0',
  `comment_group_msg_id` int NOT NULL DEFAULT '0',
  `reply_channel_id` bigint NOT NULL DEFAULT '0',
  `reply_channel_message_id` int NOT NULL DEFAULT '0',
  `reply_to` int NOT NULL DEFAULT '0',
  `reply_to_top_id` int NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_messages_v2`
--

CREATE TABLE IF NOT EXISTS `channel_messages_v2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `from_id_type` int NOT NULL DEFAULT '0',
  `from_id` bigint NOT NULL DEFAULT '0',
  `pts` int NOT NULL DEFAULT '0',
  `mentioned` int NOT NULL DEFAULT '0',
  `has_media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `silent` tinyint(1) NOT NULL DEFAULT '0',
  `post` tinyint(1) NOT NULL DEFAULT '0',
  `post_author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `legacy` tinyint(1) NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `message` varchar(4048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `views` int NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_user_id` (`sender_user_id`,`random_id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`),
  UNIQUE KEY `message_data_id` (`dialog_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_message_reactions`
--

CREATE TABLE IF NOT EXISTS `channel_message_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `channel_message_id` int NOT NULL,
  `message_sender_user_id` bigint NOT NULL DEFAULT '0',
  `reacted_user_id` bigint NOT NULL,
  `is_me` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `big` tinyint(1) NOT NULL DEFAULT '0',
  `unread` tinyint(1) NOT NULL DEFAULT '0',
  `chosen_order` int NOT NULL,
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_id` (`channel_id`,`channel_message_id`,`reacted_user_id`,`chosen_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_participants`
--

CREATE TABLE IF NOT EXISTS `channel_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `participant_type` int NOT NULL DEFAULT '0',
  `is_creator` tinyint(1) NOT NULL DEFAULT '0',
  `is_bot` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usage2` int NOT NULL DEFAULT '0',
  `inviter_user_id` bigint NOT NULL DEFAULT '0',
  `promoted_by` bigint NOT NULL DEFAULT '0',
  `admin_rights` int NOT NULL DEFAULT '0',
  `hidden_prehistory` tinyint(1) NOT NULL DEFAULT '0',
  `hidden_prehistory_message_id` int NOT NULL DEFAULT '0',
  `kicked_by` bigint NOT NULL DEFAULT '0',
  `banned_rights` bigint NOT NULL DEFAULT '0',
  `migrated_from_chat_id` bigint NOT NULL DEFAULT '0',
  `migrated_from_max_id` int NOT NULL DEFAULT '0',
  `available_min_id` int NOT NULL DEFAULT '0',
  `available_min_pts` int NOT NULL DEFAULT '0',
  `rank2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `has_scheduled` int NOT NULL DEFAULT '0',
  `groupcall_default_join_as_peer_type` int NOT NULL DEFAULT '0',
  `groupcall_default_join_as_peer_id` bigint NOT NULL DEFAULT '0',
  `slowmode_last_send_date` bigint NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_id` (`channel_id`,`user_id`),
  KEY `chat_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_pts_updates`
--

CREATE TABLE IF NOT EXISTS `channel_pts_updates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL DEFAULT '0',
  `pts` int NOT NULL,
  `pts_count` int NOT NULL,
  `update_type` int NOT NULL DEFAULT '0',
  `new_message_id` int NOT NULL DEFAULT '0',
  `update_data` json NOT NULL,
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_id` (`channel_id`,`pts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_reactions`
--

CREATE TABLE IF NOT EXISTS `channel_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `channel_id` bigint NOT NULL,
  `reaction_message_id` int NOT NULL,
  `reaction_user_id` bigint NOT NULL,
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unread` tinyint(1) NOT NULL DEFAULT '0',
  `date` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_id` (`channel_id`,`reaction_message_id`,`reaction_user_id`),
  KEY `channel_id_2` (`channel_id`,`reaction_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `channel_unread_mentions`
--

CREATE TABLE IF NOT EXISTS `channel_unread_mentions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `channel_id` bigint NOT NULL,
  `mentioned_message_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`channel_id`,`mentioned_message_id`),
  KEY `user_id_2` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `chatlist_exported_invite`
--

CREATE TABLE IF NOT EXISTS `chatlist_exported_invite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `dialog_filter_id` int NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `peers` json NOT NULL,
  `date` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`,`dialog_filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `chats`
--

CREATE TABLE IF NOT EXISTS `chats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creator_user_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `participant_count` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `photo_id` bigint NOT NULL DEFAULT '0',
  `default_banned_rights` bigint NOT NULL DEFAULT '0',
  `migrated_to_id` bigint NOT NULL DEFAULT '0',
  `migrated_to_access_hash` bigint NOT NULL DEFAULT '0',
  `available_reactions_type` int NOT NULL DEFAULT '0',
  `available_reactions` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deactivated` tinyint(1) NOT NULL DEFAULT '0',
  `noforwards` tinyint(1) NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `version` int NOT NULL DEFAULT '1',
  `date` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `chat_invites`
--

CREATE TABLE IF NOT EXISTS `chat_invites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chat_id` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `migrated_to_id` bigint NOT NULL DEFAULT '0',
  `link` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permanent` tinyint(1) NOT NULL DEFAULT '0',
  `revoked` tinyint(1) NOT NULL DEFAULT '0',
  `request_needed` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` bigint NOT NULL DEFAULT '0',
  `expire_date` bigint NOT NULL DEFAULT '0',
  `usage_limit` int NOT NULL DEFAULT '0',
  `usage2` int NOT NULL DEFAULT '0',
  `requested` int NOT NULL DEFAULT '0',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date2` bigint NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`),
  KEY `chat_id` (`chat_id`,`permanent`,`admin_id`),
  KEY `chat_id_2` (`chat_id`,`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `chat_invite_participants`
--

CREATE TABLE IF NOT EXISTS `chat_invite_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chat_id` bigint NOT NULL,
  `link` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `approved_by` bigint NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`,`user_id`),
  KEY `link_2` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `chat_participants`
--

CREATE TABLE IF NOT EXISTS `chat_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chat_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `participant_type` int DEFAULT '0',
  `link` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `usage2` int NOT NULL DEFAULT '0',
  `admin_rights` int NOT NULL DEFAULT '0',
  `inviter_user_id` bigint NOT NULL DEFAULT '0',
  `invited_at` bigint NOT NULL DEFAULT '0',
  `kicked_at` bigint NOT NULL DEFAULT '0',
  `left_at` bigint NOT NULL DEFAULT '0',
  `groupcall_default_join_as_peer_type` int NOT NULL DEFAULT '0',
  `groupcall_default_join_as_peer_id` bigint NOT NULL DEFAULT '0',
  `is_bot` tinyint(1) NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_id_2` (`chat_id`,`user_id`),
  KEY `chat_id` (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `close_friends`
--

CREATE TABLE IF NOT EXISTS `close_friends` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `close_friend_id` bigint NOT NULL,
  `date` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`close_friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `color_options`
--

CREATE TABLE IF NOT EXISTS `color_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color_id` int NOT NULL,
  `is_profile` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `colors` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `dark_colors` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `channel_min_level` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `color_id` (`color_id`,`is_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `config_type` int NOT NULL DEFAULT '0',
  `key2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_type` (`config_type`,`key2`),
  KEY `config_type_2` (`config_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `conversations`
--

CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `peer_id` int NOT NULL,
  `is_pinned` tinyint NOT NULL DEFAULT '0',
  `order_pinned` bigint NOT NULL DEFAULT '0',
  `top_message` int NOT NULL DEFAULT '0',
  `pinned_msg_id` int NOT NULL DEFAULT '0',
  `read_inbox_max_id` int NOT NULL DEFAULT '0',
  `read_outbox_max_id` int NOT NULL DEFAULT '0',
  `unread_count` int NOT NULL DEFAULT '0',
  `unread_mark` tinyint NOT NULL DEFAULT '0',
  `draft_type` tinyint NOT NULL DEFAULT '0',
  `draft_message_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int NOT NULL DEFAULT '0',
  `folder_pinned` int NOT NULL DEFAULT '0',
  `folder_order_pinned` bigint NOT NULL DEFAULT '0',
  `has_scheduled` int NOT NULL DEFAULT '0',
  `date2` int NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `conversation_message`
--

CREATE TABLE IF NOT EXISTS `conversation_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `secret_key_id` bigint NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `media_type` bigint NOT NULL DEFAULT '0',
  `media_id` bigint NOT NULL DEFAULT '0',
  `media_state` int NOT NULL DEFAULT '0',
  `forwards` int NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `edit_hide` tinyint(1) NOT NULL DEFAULT '0',
  `edit_date` bigint NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `grouped_id` bigint NOT NULL DEFAULT '0',
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  `restriction_reason` json DEFAULT NULL,
  `ttl_period` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `default_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iso2` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `country_codes`
--

CREATE TABLE IF NOT EXISTS `country_codes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `country_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `devices`
--

CREATE TABLE IF NOT EXISTS `devices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth_key_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `token_type` int NOT NULL,
  `token` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_muted` tinyint(1) NOT NULL DEFAULT '0',
  `locked_period` int NOT NULL DEFAULT '0',
  `app_sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `other_uids` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_key_id` (`auth_key_id`,`user_id`,`token_type`),
  KEY `user_id` (`user_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `dialogs`
--

CREATE TABLE IF NOT EXISTS `dialogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL DEFAULT '2',
  `peer_id` bigint NOT NULL,
  `peer_dialog_id` bigint NOT NULL,
  `pinned` bigint NOT NULL DEFAULT '0',
  `top_message` int NOT NULL DEFAULT '0',
  `pinned_msg_id` int NOT NULL DEFAULT '0',
  `read_inbox_max_id` int NOT NULL DEFAULT '0',
  `read_outbox_max_id` int NOT NULL DEFAULT '0',
  `unread_count` int NOT NULL DEFAULT '0',
  `unread_mentions_count` int NOT NULL DEFAULT '0',
  `unread_reactions_count` int NOT NULL DEFAULT '0',
  `unread_mark` tinyint(1) NOT NULL DEFAULT '0',
  `draft_type` int NOT NULL DEFAULT '0',
  `draft_message_data` json NOT NULL,
  `folder_id` int NOT NULL DEFAULT '0',
  `folder_pinned` bigint NOT NULL DEFAULT '0',
  `has_scheduled` tinyint(1) NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `theme_emoticon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_type`,`peer_id`),
  UNIQUE KEY `user_id_2` (`user_id`,`peer_dialog_id`),
  KEY `user_id_3` (`user_id`,`peer_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `dialog_filters`
--

CREATE TABLE IF NOT EXISTS `dialog_filters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `dialog_filter_id` int NOT NULL,
  `is_chatlist` tinyint(1) NOT NULL DEFAULT '0',
  `joined_by_slug` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `has_my_invites` int NOT NULL DEFAULT '0',
  `dialog_filter` json NOT NULL,
  `order_value` bigint NOT NULL DEFAULT '0',
  `from_suggested` int NOT NULL DEFAULT '-1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`dialog_filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `dialog_filter_suggested`
--

CREATE TABLE IF NOT EXISTS `dialog_filter_suggested` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dialog_filter_id` int NOT NULL,
  `dialog_filter` json NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `dc_id` int NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` bigint NOT NULL,
  `uploaded_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ext` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumb_id` bigint NOT NULL DEFAULT '0',
  `video_thumb_id` bigint NOT NULL DEFAULT '0',
  `version` int NOT NULL DEFAULT '0',
  `attributes` json NOT NULL,
  `date2` bigint NOT NULL DEFAULT '0',
  `import_document_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_id` (`document_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `drafts`
--

CREATE TABLE IF NOT EXISTS `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `peer_dialog_id` bigint NOT NULL,
  `draft_type` int NOT NULL,
  `draft_message_data` json NOT NULL,
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_dialog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `effects`
--

CREATE TABLE IF NOT EXISTS `effects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effect_id` bigint NOT NULL,
  `premium_required` tinyint(1) NOT NULL DEFAULT '0',
  `emoticon` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `static_icon_id` bigint NOT NULL DEFAULT '0',
  `effect_sticker_id` bigint NOT NULL,
  `effect_animation_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `effect_id` (`effect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `emoji_categories`
--

CREATE TABLE IF NOT EXISTS `emoji_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categories` int NOT NULL,
  `emoji_group_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories` (`categories`,`emoji_group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `emoji_groups`
--

CREATE TABLE IF NOT EXISTS `emoji_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `clazz` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `icon_emoji_id` bigint NOT NULL,
  `emoticons` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `emoji_keywords`
--

CREATE TABLE IF NOT EXISTS `emoji_keywords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keyword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emoticons` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code_2` (`lang_code`,`keyword`),
  KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `emoji_languages`
--

CREATE TABLE IF NOT EXISTS `emoji_languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `emoji_list`
--

CREATE TABLE IF NOT EXISTS `emoji_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `default_profile_photo` tinyint(1) NOT NULL DEFAULT '0',
  `default_group_photo` tinyint(1) NOT NULL DEFAULT '0',
  `default_background` tinyint(1) NOT NULL DEFAULT '0',
  `channel_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `emoji_status`
--

CREATE TABLE IF NOT EXISTS `emoji_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `document_id` bigint NOT NULL,
  `import_document_id` bigint NOT NULL,
  `default2` tinyint(1) NOT NULL DEFAULT '0',
  `default_channel` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_id` (`document_id`),
  UNIQUE KEY `import_document_id` (`import_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `encrypted_files`
--

CREATE TABLE IF NOT EXISTS `encrypted_files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `encrypted_file_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `dc_id` int NOT NULL,
  `file_size` bigint NOT NULL,
  `key_fingerprint` int NOT NULL,
  `md5_checksum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `creator_id` bigint NOT NULL DEFAULT '0',
  `creator_user_id` bigint NOT NULL DEFAULT '0',
  `file_part_id` bigint NOT NULL DEFAULT '0',
  `file_parts` int NOT NULL DEFAULT '0',
  `file_size` bigint NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_big_file` tinyint(1) NOT NULL DEFAULT '0',
  `md5_checksum` char(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `file_parts`
--

CREATE TABLE IF NOT EXISTS `file_parts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creator_id` bigint NOT NULL DEFAULT '0',
  `creator_user_id` bigint NOT NULL DEFAULT '0',
  `file_id` bigint NOT NULL DEFAULT '0',
  `file_part_id` bigint NOT NULL,
  `file_part` int NOT NULL DEFAULT '0',
  `is_big_file` tinyint(1) NOT NULL DEFAULT '0',
  `file_total_parts` int NOT NULL DEFAULT '0',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `autofill_new_broadcasts` tinyint(1) NOT NULL DEFAULT '0',
  `autofill_public_groups` tinyint(1) NOT NULL DEFAULT '0',
  `autofill_new_correspondents` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `forum_topics`
--

CREATE TABLE IF NOT EXISTS `forum_topics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topic_id` int NOT NULL,
  `channel_id` bigint NOT NULL,
  `creator` bigint NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `icon_color` int NOT NULL,
  `icon_emoji_id` bigint NOT NULL DEFAULT '0',
  `top_message` int NOT NULL,
  `pinned` bigint NOT NULL DEFAULT '0',
  `short` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `date` bigint NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `read_inbox_max_id` int NOT NULL DEFAULT '0',
  `read_outbox_max_id` int NOT NULL DEFAULT '0',
  `unread_count` int NOT NULL DEFAULT '0',
  `unread_mentions_count` int NOT NULL DEFAULT '0',
  `unread_reactions_count` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `topic_id` (`topic_id`,`channel_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `giphy_datas`
--

CREATE TABLE IF NOT EXISTS `giphy_datas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `giphy_id` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` bigint NOT NULL,
  `photo_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `giphy_id` (`giphy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `group_calls`
--

CREATE TABLE IF NOT EXISTS `group_calls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `chat_type` int NOT NULL,
  `chat_id` bigint NOT NULL,
  `join_muted` tinyint(1) NOT NULL DEFAULT '0',
  `can_change_join_muted` tinyint(1) NOT NULL DEFAULT '0',
  `params` json NOT NULL,
  `version` int NOT NULL DEFAULT '1',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `call_id` (`call_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `group_call_participants`
--

CREATE TABLE IF NOT EXISTS `group_call_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `muted` tinyint(1) NOT NULL DEFAULT '0',
  `left2` tinyint(1) NOT NULL DEFAULT '0',
  `can_self_unmute` tinyint(1) NOT NULL DEFAULT '0',
  `just_joined` tinyint(1) NOT NULL DEFAULT '0',
  `versioned` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `active_date` bigint NOT NULL DEFAULT '0',
  `source` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `hash_tags`
--

CREATE TABLE IF NOT EXISTS `hash_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `hash_tag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash_tag_message_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_4` (`user_id`,`hash_tag`,`hash_tag_message_id`),
  KEY `user_id` (`user_id`,`hash_tag`),
  KEY `user_id_2` (`user_id`,`peer_type`,`peer_id`,`hash_tag`),
  KEY `user_id_3` (`user_id`,`hash_tag_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `imported_contacts`
--

CREATE TABLE IF NOT EXISTS `imported_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `imported_user_id` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_id_2` (`user_id`,`imported_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_lang_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `official` tinyint(1) NOT NULL DEFAULT '0',
  `rtl` tinyint(1) NOT NULL DEFAULT '0',
  `beta` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `native_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plural_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `translations_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `outbox_read_date` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_0`
--

CREATE TABLE IF NOT EXISTS `messages_0` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_3` (`user_id`,`random_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_1`
--

CREATE TABLE IF NOT EXISTS `messages_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_3` (`user_id`,`random_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_2`
--

CREATE TABLE IF NOT EXISTS `messages_2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_3` (`user_id`,`random_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_3`
--

CREATE TABLE IF NOT EXISTS `messages_3` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_3` (`user_id`,`random_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_4`
--

CREATE TABLE IF NOT EXISTS `messages_4` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_3` (`user_id`,`random_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_5`
--

CREATE TABLE IF NOT EXISTS `messages_5` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_3` (`user_id`,`random_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_6`
--

CREATE TABLE IF NOT EXISTS `messages_6` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_3` (`user_id`,`random_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `messages_7`
--

CREATE TABLE IF NOT EXISTS `messages_7` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `saved_peer_type` int NOT NULL DEFAULT '0',
  `saved_peer_id` bigint NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `ttl_period` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`user_message_box_id`),
  UNIQUE KEY `user_id_4` (`user_id`,`random_id`),
  KEY `user_id_3` (`user_id`,`user_message_box_id`,`dialog_id1`,`dialog_id2`),
  KEY `user_id_2` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `message_inbox`
--

CREATE TABLE IF NOT EXISTS `message_inbox` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `dialog_id1` bigint NOT NULL,
  `dialog_id2` bigint NOT NULL,
  `dialog_message_id` bigint NOT NULL,
  `sender_user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_filter_type` int NOT NULL DEFAULT '0',
  `message_data` json DEFAULT NULL,
  `message` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mentioned` tinyint(1) NOT NULL DEFAULT '0',
  `media_unread` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reaction_date` bigint NOT NULL DEFAULT '0',
  `reaction_unread` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`user_message_box_id`),
  KEY `user_id` (`user_id`,`dialog_id1`,`dialog_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `message_reactions`
--

CREATE TABLE IF NOT EXISTS `message_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dialog_message_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL DEFAULT '0',
  `sender_user_id` bigint NOT NULL DEFAULT '0',
  `peer_type` int NOT NULL DEFAULT '0',
  `peer_id` bigint NOT NULL DEFAULT '0',
  `reacted_user_id` bigint NOT NULL,
  `is_me` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `big` tinyint(1) NOT NULL DEFAULT '0',
  `unread` tinyint(1) NOT NULL DEFAULT '0',
  `chosen_order` int NOT NULL,
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dialog_message_id_3` (`dialog_message_id`,`reacted_user_id`,`chosen_order`),
  KEY `dialog_message_id` (`dialog_message_id`,`reacted_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `message_reaction_count`
--

CREATE TABLE IF NOT EXISTS `message_reaction_count` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dialog_message_id` bigint NOT NULL,
  `reaction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `count` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dialog_message_id` (`dialog_message_id`,`reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `message_read_outbox`
--

CREATE TABLE IF NOT EXISTS `message_read_outbox` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_dialog_id` bigint NOT NULL,
  `read_user_id` bigint NOT NULL,
  `read_outbox_max_id` int NOT NULL,
  `read_outbox_max_date` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_dialog_id`,`read_user_id`,`read_outbox_max_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `message_threads`
--

CREATE TABLE IF NOT EXISTS `message_threads` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `thread_group_id` bigint NOT NULL,
  `thread_id` int NOT NULL,
  `comments` tinyint(1) NOT NULL DEFAULT '0',
  `replies` int NOT NULL DEFAULT '0',
  `replies_pts` int NOT NULL DEFAULT '0',
  `max_id` int NOT NULL DEFAULT '0',
  `read_max_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thread_group_id` (`thread_group_id`,`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `message_thread_replies`
--

CREATE TABLE IF NOT EXISTS `message_thread_replies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `thread_group_id` bigint NOT NULL,
  `reply_msg_id` int NOT NULL,
  `reply_peer_type` int NOT NULL,
  `reply_peer_id` bigint NOT NULL,
  `reply_to_msg_id` int NOT NULL,
  `thread_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thread_group_id` (`thread_group_id`,`reply_msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CN',
  `region_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '86',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `phone_books`
--

CREATE TABLE IF NOT EXISTS `phone_books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0',
  `auth_key_id` bigint NOT NULL,
  `client_id` bigint NOT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_key_id` (`auth_key_id`,`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `phone_call_debugs`
--

CREATE TABLE IF NOT EXISTS `phone_call_debugs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` bigint NOT NULL,
  `participant_id` bigint NOT NULL,
  `participant_auth_key_id` bigint NOT NULL DEFAULT '0',
  `debug_data` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `call_id` (`call_id`,`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `phone_call_logs`
--

CREATE TABLE IF NOT EXISTS `phone_call_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `admin_auth_key_id` bigint NOT NULL DEFAULT '0',
  `participant_id` bigint NOT NULL,
  `participant_auth_key_id` bigint NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `start_date` bigint NOT NULL DEFAULT '0',
  `duration` int NOT NULL DEFAULT '0',
  `discard_reason` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `discard_date` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `call_id` (`call_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `phone_call_ratings`
--

CREATE TABLE IF NOT EXISTS `phone_call_ratings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `call_id` bigint NOT NULL,
  `participant_id` bigint NOT NULL,
  `participant_auth_key_id` bigint NOT NULL DEFAULT '0',
  `user_initiative` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int NOT NULL DEFAULT '0',
  `comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `call_id` (`call_id`,`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `phone_call_sessions`
--

CREATE TABLE IF NOT EXISTS `phone_call_sessions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `access_hash` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `participant_id` bigint NOT NULL,
  `admin_auth_key_id` bigint NOT NULL DEFAULT '0',
  `participant_auth_key_id` bigint NOT NULL DEFAULT '0',
  `random_id` bigint NOT NULL,
  `admin_protocol` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `participant_protocol` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `g_a_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `g_a` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `g_b` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `key_fingerprint` bigint NOT NULL DEFAULT '0',
  `connections` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_debug_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `participant_debug_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_rating` int NOT NULL DEFAULT '0',
  `admin_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `participant_rating` int NOT NULL DEFAULT '0',
  `participant_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` bigint NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_auth_key_id` (`admin_auth_key_id`,`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `photo_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `has_stickers` tinyint(1) NOT NULL DEFAULT '0',
  `dc_id` int NOT NULL DEFAULT '2',
  `date2` bigint NOT NULL DEFAULT '0',
  `has_video` tinyint(1) NOT NULL DEFAULT '0',
  `size_id` bigint NOT NULL DEFAULT '0',
  `video_size_id` bigint NOT NULL DEFAULT '0',
  `input_file_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ext` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photo_id` (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `photo_sizes`
--

CREATE TABLE IF NOT EXISTS `photo_sizes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `photo_size_id` bigint NOT NULL,
  `size_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `volume_id` bigint NOT NULL DEFAULT '0',
  `local_id` int NOT NULL DEFAULT '0',
  `secret` bigint NOT NULL DEFAULT '0',
  `width` int NOT NULL,
  `height` int NOT NULL,
  `file_size` int NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_stripped` tinyint(1) NOT NULL DEFAULT '0',
  `stripped_bytes` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cached_type` int NOT NULL DEFAULT '0',
  `cached_bytes` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photo_size_id` (`photo_size_id`,`size_type`),
  KEY `photo_id` (`photo_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `poll_id` bigint NOT NULL DEFAULT '0',
  `creator` bigint NOT NULL,
  `question` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `close_period` int DEFAULT '0',
  `close_date` bigint NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `public_voters` tinyint(1) NOT NULL DEFAULT '0',
  `multiple_choice` tinyint(1) NOT NULL DEFAULT '0',
  `quiz` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer0` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer1` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer2` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer3` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer4` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer5` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer6` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer7` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer8` tinyint(1) NOT NULL DEFAULT '0',
  `correct_answer9` tinyint(1) NOT NULL DEFAULT '0',
  `text0` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option0` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voters0` int NOT NULL DEFAULT '0',
  `text1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters1` int NOT NULL DEFAULT '0',
  `text2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters2` int NOT NULL DEFAULT '0',
  `text3` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option3` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voters3` int NOT NULL DEFAULT '0',
  `text4` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option4` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters4` int NOT NULL DEFAULT '0',
  `text5` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option5` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters5` int NOT NULL DEFAULT '0',
  `text6` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option6` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters6` int NOT NULL DEFAULT '0',
  `text7` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option7` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters7` int NOT NULL DEFAULT '0',
  `text8` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option8` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters8` int NOT NULL DEFAULT '0',
  `text9` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option9` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `voters9` int NOT NULL DEFAULT '0',
  `solution` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `solution_entities` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `poll_answer_voters`
--

CREATE TABLE IF NOT EXISTS `poll_answer_voters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `poll_id` bigint NOT NULL,
  `vote_user_id` bigint NOT NULL,
  `options` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option0` tinyint(1) NOT NULL DEFAULT '0',
  `option1` tinyint(1) NOT NULL DEFAULT '0',
  `option2` tinyint(1) NOT NULL DEFAULT '0',
  `option3` tinyint(1) NOT NULL DEFAULT '0',
  `option4` tinyint(1) NOT NULL DEFAULT '0',
  `option5` tinyint(1) NOT NULL DEFAULT '0',
  `option6` tinyint(1) NOT NULL DEFAULT '0',
  `option7` tinyint(1) NOT NULL DEFAULT '0',
  `option8` tinyint(1) NOT NULL DEFAULT '0',
  `option9` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_id` (`poll_id`,`vote_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `popular_contacts`
--

CREATE TABLE IF NOT EXISTS `popular_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `importers` int NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `predefined_users`
--

CREATE TABLE IF NOT EXISTS `predefined_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `registered_user_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `reactions`
--

CREATE TABLE IF NOT EXISTS `reactions` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `reaction` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `static_icon_id` bigint NOT NULL,
  `appear_animation_id` bigint NOT NULL,
  `select_animation_id` bigint NOT NULL,
  `activate_animation_id` bigint NOT NULL,
  `effect_animation_id` bigint NOT NULL,
  `around_animation_id` bigint NOT NULL,
  `center_icon_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reaction` (`reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `report_type` int NOT NULL DEFAULT '0',
  `peer_type` int NOT NULL DEFAULT '0',
  `peer_id` bigint NOT NULL DEFAULT '0',
  `profile_photo_id` bigint NOT NULL DEFAULT '0',
  `message_sender_user_id` bigint NOT NULL DEFAULT '0',
  `message_id` int NOT NULL DEFAULT '0',
  `story_id` int NOT NULL DEFAULT '0',
  `reason` int NOT NULL DEFAULT '0',
  `text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `restrictions`
--

CREATE TABLE IF NOT EXISTS `restrictions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ringtones`
--

CREATE TABLE IF NOT EXISTS `ringtones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `ringtone_id` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`ringtone_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `saved_dialogs`
--

CREATE TABLE IF NOT EXISTS `saved_dialogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `pinned` bigint NOT NULL DEFAULT '0',
  `top_message` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_type`,`peer_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `saved_gifs`
--

CREATE TABLE IF NOT EXISTS `saved_gifs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `gif_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`gif_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `scheduled_messages`
--

CREATE TABLE IF NOT EXISTS `scheduled_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_message_box_id` int NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `dialog_id` bigint NOT NULL,
  `random_id` bigint NOT NULL DEFAULT '0',
  `message_data` json NOT NULL,
  `scheduled_date` bigint NOT NULL,
  `date2` bigint NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `secret_chats`
--

CREATE TABLE IF NOT EXISTS `secret_chats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `access_hash` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `participant_id` bigint NOT NULL,
  `admin_auth_key_id` bigint NOT NULL DEFAULT '0',
  `participant_auth_key_id` bigint NOT NULL DEFAULT '0',
  `random_id` int NOT NULL,
  `g_a` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `g_b` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `key_fingerprint` bigint NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `date` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `secret_chat_messages`
--

CREATE TABLE IF NOT EXISTS `secret_chat_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sender_user_id` bigint NOT NULL,
  `chat_id` bigint NOT NULL,
  `peer_id` bigint NOT NULL,
  `random_id` bigint NOT NULL,
  `message_type` int NOT NULL DEFAULT '0',
  `message_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `secret_chat_qts_updates`
--

CREATE TABLE IF NOT EXISTS `secret_chat_qts_updates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `auth_key_id` bigint NOT NULL,
  `chat_id` bigint NOT NULL,
  `qts` int NOT NULL,
  `chat_message_id` bigint NOT NULL,
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `auth_key_id` (`auth_key_id`,`qts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `sticker_packs`
--

CREATE TABLE IF NOT EXISTS `sticker_packs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sticker_set_id` bigint NOT NULL,
  `emoticon` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `sticker_id` bigint NOT NULL,
  `import_sticker_id` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sticker_set_id` (`sticker_set_id`,`emoticon`,`sticker_id`) USING BTREE,
  KEY `sticker_set_id_2` (`sticker_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `sticker_sets`
--

CREATE TABLE IF NOT EXISTS `sticker_sets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sticker_set_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `creator` bigint NOT NULL DEFAULT '0',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  `hash` int NOT NULL DEFAULT '0',
  `emoji` tinyint(1) NOT NULL DEFAULT '0',
  `official` tinyint(1) NOT NULL DEFAULT '0',
  `masks` tinyint(1) NOT NULL DEFAULT '0',
  `animated` tinyint(1) NOT NULL DEFAULT '0',
  `text_color` tinyint(1) NOT NULL DEFAULT '0',
  `channel_emoji_status` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `thumb_id` bigint NOT NULL DEFAULT '0',
  `cover_sticker_id` bigint NOT NULL DEFAULT '0',
  `import_sticker_set_id` bigint NOT NULL,
  `import_software` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `videos` tinyint(1) NOT NULL DEFAULT '0',
  `thumb_dc_id` int NOT NULL DEFAULT '0',
  `thumb_version` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sticker_set_id` (`sticker_set_id`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `sticker_set_covers`
--

CREATE TABLE IF NOT EXISTS `sticker_set_covers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sticker_set_id` bigint NOT NULL,
  `cover_id` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sticker_set_id` (`sticker_set_id`,`cover_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `sticker_set_stickers`
--

CREATE TABLE IF NOT EXISTS `sticker_set_stickers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sticker_set_id` bigint NOT NULL,
  `emoticon` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `sticker_id` bigint NOT NULL,
  `import_sticker_id` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sticker_set_id` (`sticker_set_id`,`emoticon`,`sticker_id`) USING BTREE,
  KEY `sticker_set_id_2` (`sticker_set_id`),
  KEY `emoticon` (`emoticon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `stories`
--

CREATE TABLE IF NOT EXISTS `stories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `owner_peer_id` bigint NOT NULL,
  `story_type` int NOT NULL DEFAULT '0',
  `story_id` int NOT NULL,
  `post_user_id` bigint NOT NULL DEFAULT '0',
  `pinned` bigint NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `close_friends` tinyint(1) NOT NULL DEFAULT '0',
  `noforwards` tinyint(1) NOT NULL DEFAULT '0',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `contacts` tinyint(1) NOT NULL DEFAULT '0',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `fwd_from` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `expire_date` bigint NOT NULL,
  `story_data` json NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_blocklist`
--

CREATE TABLE IF NOT EXISTS `story_blocklist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`peer_type`,`peer_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_data`
--

CREATE TABLE IF NOT EXISTS `story_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `story_id` int NOT NULL,
  `pinned` bigint NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `close_friends` tinyint(1) NOT NULL DEFAULT '0',
  `noforwards` tinyint(1) NOT NULL DEFAULT '0',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `contacts` tinyint(1) NOT NULL DEFAULT '0',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `random_id` bigint NOT NULL,
  `fwd_from` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `expire_date` bigint NOT NULL,
  `story_data` json NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`story_id`),
  UNIQUE KEY `user_id_2` (`user_id`,`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_hidden`
--

CREATE TABLE IF NOT EXISTS `story_hidden` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL DEFAULT '0',
  `peer_id` bigint NOT NULL,
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_sent_reactions`
--

CREATE TABLE IF NOT EXISTS `story_sent_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `story_id` int NOT NULL,
  `reacted_user_id` bigint NOT NULL,
  `is_me` tinyint(1) NOT NULL DEFAULT '0',
  `reaction` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `big` tinyint(1) NOT NULL DEFAULT '0',
  `unread` tinyint(1) NOT NULL DEFAULT '0',
  `chosen_order` int NOT NULL,
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_stealth_mode`
--

CREATE TABLE IF NOT EXISTS `story_stealth_mode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `past` bigint NOT NULL DEFAULT '0',
  `stories_stealth_past_period` int NOT NULL DEFAULT '0',
  `future` bigint NOT NULL DEFAULT '0',
  `stories_stealth_future_period` int NOT NULL DEFAULT '0',
  `active_until_date` bigint NOT NULL DEFAULT '0',
  `cooldown_until_date` bigint NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_user_stories`
--

CREATE TABLE IF NOT EXISTS `story_user_stories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_user_id` bigint NOT NULL,
  `top_story_id` int NOT NULL,
  `expire_date` bigint NOT NULL,
  `read_max_id` int NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_views`
--

CREATE TABLE IF NOT EXISTS `story_views` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `story_id` int NOT NULL,
  `view_type` int NOT NULL DEFAULT '0',
  `view_user_id` bigint NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `blocked_my_stories_from` tinyint(1) NOT NULL DEFAULT '0',
  `has_reaction` int NOT NULL DEFAULT '0',
  `reaction_emoticon` char(4) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `reaction_document_id` bigint NOT NULL DEFAULT '0',
  `fwd_peer_type` int NOT NULL DEFAULT '0',
  `fwd_peer_id` bigint NOT NULL DEFAULT '0',
  `fwd_msg_id` int NOT NULL DEFAULT '0',
  `repost_peer_type` int NOT NULL DEFAULT '0',
  `repost_peer_id` bigint NOT NULL DEFAULT '0',
  `repost_story_id` bigint NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`story_id`,`view_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `story_views_count`
--

CREATE TABLE IF NOT EXISTS `story_views_count` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `story_id` int NOT NULL,
  `count` int NOT NULL DEFAULT '0',
  `views_count` int NOT NULL DEFAULT '0',
  `forwards_count` int NOT NULL DEFAULT '0',
  `reactions_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`story_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `strings`
--

CREATE TABLE IF NOT EXISTS `strings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang_pack` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int NOT NULL,
  `key_index` varbinary(128) NOT NULL,
  `key2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pluralized` tinyint(1) NOT NULL DEFAULT '0',
  `value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zero_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `one_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `two_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `few_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `many_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `other_value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_pack` (`lang_pack`,`lang_code`,`key_index`),
  KEY `lang_pack_2` (`lang_pack`,`lang_code`),
  KEY `lang_pack_3` (`lang_pack`,`lang_code`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `theme_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` bigint NOT NULL DEFAULT '0',
  `default2` tinyint(1) NOT NULL DEFAULT '0',
  `for_chat` tinyint(1) NOT NULL DEFAULT '0',
  `emoticon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `has_settings` tinyint(1) NOT NULL DEFAULT '0',
  `installs_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `theme_formats`
--

CREATE TABLE IF NOT EXISTS `theme_formats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `theme_id` bigint NOT NULL,
  `format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_id` (`theme_id`,`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `theme_settings`
--

CREATE TABLE IF NOT EXISTS `theme_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `theme_id` bigint NOT NULL,
  `format` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wallpaper_id` bigint DEFAULT '0',
  `wallpaper_settings_id` bigint NOT NULL DEFAULT '0',
  `message_colors_animated` tinyint(1) NOT NULL DEFAULT '0',
  `base_theme` int NOT NULL DEFAULT '0',
  `accent_color` int NOT NULL DEFAULT '0',
  `outbox_accent_color` int NOT NULL DEFAULT '0',
  `message_colors` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `theme_id` (`theme_id`,`format`,`base_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `timezones`
--

CREATE TABLE IF NOT EXISTS `timezones` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utc_offset` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `top_reactions`
--

CREATE TABLE IF NOT EXISTS `top_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `reaction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `top` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`reaction`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `unregistered_contacts`
--

CREATE TABLE IF NOT EXISTS `unregistered_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `importer_user_id` bigint NOT NULL,
  `import_first_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_last_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imported` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`,`importer_user_id`),
  KEY `phone_2` (`phone`,`importer_user_id`,`imported`),
  KEY `phone_3` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `username`
--

CREATE TABLE IF NOT EXISTS `username` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `peer_type` int NOT NULL DEFAULT '0',
  `peer_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_type` int NOT NULL DEFAULT '2',
  `access_hash` bigint NOT NULL,
  `secret_key_id` bigint NOT NULL DEFAULT '0',
  `first_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `support` tinyint(1) NOT NULL DEFAULT '0',
  `scam` tinyint(1) NOT NULL DEFAULT '0',
  `fake` tinyint(1) NOT NULL DEFAULT '0',
  `premium` tinyint(1) NOT NULL DEFAULT '0',
  `about` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` int NOT NULL DEFAULT '0',
  `is_bot` tinyint(1) NOT NULL DEFAULT '0',
  `account_days_ttl` int NOT NULL DEFAULT '180',
  `photo_id` bigint NOT NULL DEFAULT '0',
  `restricted` tinyint(1) NOT NULL DEFAULT '0',
  `restriction_reason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `archive_and_mute_new_noncontact_peers` tinyint(1) NOT NULL DEFAULT '0',
  `emoji_status_document_id` bigint NOT NULL DEFAULT '0',
  `emoji_status_until` int NOT NULL DEFAULT '0',
  `stories_max_id` int NOT NULL DEFAULT '0',
  `color` int NOT NULL DEFAULT '0',
  `color_background_emoji_id` bigint NOT NULL DEFAULT '0',
  `profile_color` int NOT NULL DEFAULT '0',
  `profile_color_background_emoji_id` bigint NOT NULL DEFAULT '0',
  `birthday` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `personal_channel_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `delete_reason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_contacts`
--

CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `owner_user_id` bigint NOT NULL,
  `contact_user_id` bigint NOT NULL,
  `contact_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mutual` tinyint(1) NOT NULL DEFAULT '0',
  `close_friend` tinyint(1) NOT NULL DEFAULT '0',
  `stories_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `owner_user_id` (`owner_user_id`,`contact_user_id`),
  KEY `owner_user_id_2` (`owner_user_id`),
  KEY `contact_user_id` (`contact_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_faved_stickers`
--

CREATE TABLE IF NOT EXISTS `user_faved_stickers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `sticker_id` bigint NOT NULL,
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`sticker_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_global_privacy_settings`
--

CREATE TABLE IF NOT EXISTS `user_global_privacy_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `archive_and_mute_new_noncontact_peers` tinyint(1) NOT NULL DEFAULT '0',
  `keep_archived_unmuted` tinyint(1) NOT NULL DEFAULT '0',
  `keep_archived_folders` tinyint(1) NOT NULL DEFAULT '0',
  `hide_read_marks` tinyint(1) NOT NULL DEFAULT '0',
  `new_noncontact_peers_require_premium` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_notify_settings`
--

CREATE TABLE IF NOT EXISTS `user_notify_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `show_previews` int NOT NULL DEFAULT '-1',
  `silent` int NOT NULL DEFAULT '-1',
  `mute_until` int NOT NULL DEFAULT '-1',
  `sound` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_type`,`peer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_passwords`
--

CREATE TABLE IF NOT EXISTS `user_passwords` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `new_algo_salt1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `v` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `srp_id` bigint NOT NULL DEFAULT '0',
  `srp_b` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `B` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hint` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `has_recovery` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code_expired` int NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_peer_blocks`
--

CREATE TABLE IF NOT EXISTS `user_peer_blocks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`peer_type`,`peer_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_peer_settings`
--

CREATE TABLE IF NOT EXISTS `user_peer_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `peer_type` int NOT NULL,
  `peer_id` bigint NOT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `report_spam` tinyint(1) NOT NULL DEFAULT '0',
  `add_contact` tinyint(1) NOT NULL DEFAULT '0',
  `block_contact` tinyint(1) NOT NULL DEFAULT '0',
  `share_contact` tinyint(1) NOT NULL DEFAULT '0',
  `need_contacts_exception` tinyint(1) NOT NULL DEFAULT '0',
  `report_geo` tinyint(1) NOT NULL DEFAULT '0',
  `autoarchived` tinyint(1) NOT NULL DEFAULT '0',
  `invite_members` tinyint(1) NOT NULL DEFAULT '0',
  `geo_distance` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`peer_type`,`peer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_presences`
--

CREATE TABLE IF NOT EXISTS `user_presences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `last_seen_at` bigint NOT NULL,
  `expires` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_privacies`
--

CREATE TABLE IF NOT EXISTS `user_privacies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `key_type` int NOT NULL DEFAULT '0',
  `rules` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`key_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_profile_photos`
--

CREATE TABLE IF NOT EXISTS `user_profile_photos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `photo_id` bigint NOT NULL,
  `date2` bigint NOT NULL COMMENT '排序',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`photo_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_pts_updates`
--

CREATE TABLE IF NOT EXISTS `user_pts_updates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `pts` int NOT NULL,
  `pts_count` int NOT NULL,
  `update_type` tinyint NOT NULL DEFAULT '0',
  `update_data` json NOT NULL,
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`pts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_qts_updates`
--

CREATE TABLE IF NOT EXISTS `user_qts_updates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `qts` int NOT NULL,
  `update_type` int NOT NULL,
  `update_data` blob NOT NULL,
  `date2` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`qts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_reactions_default`
--

CREATE TABLE IF NOT EXISTS `user_reactions_default` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `reactions_default` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_recent_emoji_status`
--

CREATE TABLE IF NOT EXISTS `user_recent_emoji_status` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `document_id` bigint NOT NULL,
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_recent_reactions`
--

CREATE TABLE IF NOT EXISTS `user_recent_reactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `reaction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date2` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_recent_stickers`
--

CREATE TABLE IF NOT EXISTS `user_recent_stickers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `sticker_id` bigint NOT NULL,
  `date2` bigint NOT NULL,
  `attached` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`sticker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_ringtones`
--

CREATE TABLE IF NOT EXISTS `user_ringtones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `ringtone_id` bigint NOT NULL,
  `date2` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`ringtone_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_settings`
--

CREATE TABLE IF NOT EXISTS `user_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `key2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`key2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_sticker_sets`
--

CREATE TABLE IF NOT EXISTS `user_sticker_sets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0',
  `sticker_set_id` bigint NOT NULL DEFAULT '0',
  `emoji` tinyint(1) NOT NULL DEFAULT '0',
  `masks` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `order_value` bigint NOT NULL DEFAULT '0',
  `installed_date` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq` (`user_id`,`sticker_set_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_term_of_services`
--

CREATE TABLE IF NOT EXISTS `user_term_of_services` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `term_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_version` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_themes`
--

CREATE TABLE IF NOT EXISTS `user_themes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `theme_id` bigint NOT NULL,
  `format` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dark` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`theme_id`,`format`),
  KEY `user_id_2` (`user_id`),
  KEY `user_id_3` (`user_id`,`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_unread_sticker_sets`
--

CREATE TABLE IF NOT EXISTS `user_unread_sticker_sets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `sticker_set_id` bigint NOT NULL,
  `read_mark` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_wallpapers`
--

CREATE TABLE IF NOT EXISTS `user_wallpapers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `wallpaper_id` bigint NOT NULL,
  `has_settings` tinyint(1) NOT NULL DEFAULT '0',
  `blur` tinyint(1) NOT NULL DEFAULT '0',
  `motion` tinyint(1) NOT NULL DEFAULT '0',
  `background_color` int NOT NULL DEFAULT '0',
  `second_background_color` int NOT NULL DEFAULT '0',
  `intensity` int NOT NULL DEFAULT '0',
  `rotation` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `video_sizes`
--

CREATE TABLE IF NOT EXISTS `video_sizes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video_size_id` bigint NOT NULL,
  `size_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` int NOT NULL,
  `height` int NOT NULL,
  `file_size` int NOT NULL DEFAULT '0',
  `video_start_ts` double NOT NULL DEFAULT '0',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `video_size_id` (`video_size_id`,`size_type`),
  KEY `video_size_id_2` (`video_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wallpapers`
--

CREATE TABLE IF NOT EXISTS `wallpapers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wallpaper_id` bigint NOT NULL,
  `access_hash` bigint NOT NULL,
  `wallpaper_type` int NOT NULL DEFAULT '0',
  `creator_id` bigint NOT NULL DEFAULT '0',
  `default2` tinyint(1) NOT NULL DEFAULT '0',
  `pattern` tinyint(1) NOT NULL DEFAULT '0',
  `dark` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` bigint NOT NULL DEFAULT '0',
  `default_settings_id` bigint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wallpaper_settings`
--

CREATE TABLE IF NOT EXISTS `wallpaper_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wallpaper_settings_id` bigint NOT NULL,
  `wallpaper_id` bigint NOT NULL,
  `dark` tinyint(1) NOT NULL DEFAULT '0',
  `blur` tinyint(1) NOT NULL DEFAULT '0',
  `motion` tinyint(1) NOT NULL DEFAULT '0',
  `background_color` int NOT NULL DEFAULT '0',
  `second_background_color` int NOT NULL DEFAULT '0',
  `third_background_color` int NOT NULL DEFAULT '0',
  `fourth_background_color` int NOT NULL DEFAULT '0',
  `intensity` int NOT NULL DEFAULT '0',
  `rotation` int NOT NULL DEFAULT '0',
  `hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallpaper_settings_id` (`wallpaper_settings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wallpaper_slugs`
--

CREATE TABLE IF NOT EXISTS `wallpaper_slugs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallpaper_type` int NOT NULL DEFAULT '0',
  `creator_id` bigint NOT NULL DEFAULT '0',
  `pattern` tinyint(1) NOT NULL DEFAULT '0',
  `document_id` bigint NOT NULL DEFAULT '0',
  `slug_wallpaper_id` bigint NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `webfile_cache`
--

CREATE TABLE IF NOT EXISTS `webfile_cache` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_hash` bigint NOT NULL,
  `is_geo` tinyint(1) NOT NULL DEFAULT '0',
  `size` int NOT NULL,
  `mime_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'storage_fileUnknown',
  `mtime` int NOT NULL,
  `file_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
