# init database
## init teamgram

- create database teamgram

- init teamgram data

```
mysql -uteamgram -pteamgram teamgram < 0_0_teamgram.sql
mysql -uteamgram -pteamgram teamgram < 0_1_teamgram-fix.sql
mysql -uteamgram -pteamgram teamgram < 1_app_configs.sql
mysql -uteamgram -pteamgram teamgram < 1_app_languages.sql
mysql -uteamgram -pteamgram teamgram < 1_bot_commands.sql
mysql -uteamgram -pteamgram teamgram < 1_bots.sql
mysql -uteamgram -pteamgram teamgram < 1_channels.sql
mysql -uteamgram -pteamgram teamgram < 1_color_options.sql
mysql -uteamgram -pteamgram teamgram < 1_configs.sql
mysql -uteamgram -pteamgram teamgram < 1_countries.sql
mysql -uteamgram -pteamgram teamgram < 1_country_codes.sql
mysql -uteamgram -pteamgram teamgram < 1_emoji_keywords.sql
mysql -uteamgram -pteamgram teamgram < 1_emoji_languages.sql
mysql -uteamgram -pteamgram teamgram < 1_languages.sql
mysql -uteamgram -pteamgram teamgram < 1_strings.sql
mysql -uteamgram -pteamgram teamgram < 1_timezones.sql
mysql -uteamgram -pteamgram teamgram < 1_username.sql
mysql -uteamgram -pteamgram teamgram < 1_users.sql
mysql -uteamgram -pteamgram teamgram < migrate-20241105.sql
mysql -uteamgram -pteamgram teamgram < migrate-20241119.sql
mysql -uteamgram -pteamgram teamgram < migrate-20241123.sql
mysql -uteamgram -pteamgram teamgram < migrate-20241206.sql
mysql -uteamgram -pteamgram teamgram < migrate-20241227.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250102.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250109.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250112.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250317.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250324.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250408.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250410.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250414.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250415.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250427.sql
mysql -uteamgram -pteamgram teamgram < migrate-20250529.sql
```
