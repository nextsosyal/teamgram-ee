ALTER TABLE `users` ADD `main_tab` INT NOT NULL DEFAULT '0' AFTER `saved_music_id`;
ALTER TABLE `channels` ADD `main_tab` INT NOT NULL DEFAULT '0' AFTER `level`;
