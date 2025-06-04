ALTER TABLE `bots` ADD `bot_can_edit` BOOLEAN NOT NULL DEFAULT FALSE AFTER `menu_button_url`, ADD `has_preview_medias` BOOLEAN NOT NULL DEFAULT FALSE AFTER `bot_can_edit`;
ALTER TABLE `bots` ADD `main_app_url` VARCHAR(255) NOT NULL DEFAULT '' AFTER `has_preview_medias`;
ALTER TABLE `bots` ADD `description_photo_id` BIGINT NOT NULL DEFAULT '0' AFTER `has_preview_medias`, ADD `description_document_id` BIGINT NOT NULL DEFAULT '0' AFTER `description_photo_id`;
ALTER TABLE `bots` ADD `has_app_settings` BOOLEAN NOT NULL DEFAULT FALSE AFTER `main_app_url`, ADD `placeholder_path` VARCHAR(4096) NOT NULL DEFAULT '' AFTER `has_app_settings`, ADD `background_color` INT NOT NULL DEFAULT '0' AFTER `placeholder_path`, ADD `background_dark_color` INT NOT NULL DEFAULT '0' AFTER `background_color`, ADD `header_color` INT NOT NULL DEFAULT '0' AFTER `background_dark_color`;
ALTER TABLE `bots` ADD `header_dark_color` INT NOT NULL DEFAULT '0' AFTER `header_color`;
ALTER TABLE `bots` ADD `privacy_policy_url` VARCHAR(255) NOT NULL DEFAULT '' AFTER `header_dark_color`;
ALTER TABLE `bots` ADD `mode` INT NOT NULL DEFAULT '0' AFTER `privacy_policy_url`;
