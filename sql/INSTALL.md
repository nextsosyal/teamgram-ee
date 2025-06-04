# init database
## init teamgram

- create database teamgram

- init teamgram data

```
mysql -uroot teamgram < teamgram.sql
mysql -uroot teamgram < teamgram-fix.sql

mysql -uroot teamgram < init/app_configs.sql
mysql -uroot teamgram < init/app_languages.sql
mysql -uroot teamgram < init/bot_commands.sql
mysql -uroot teamgram < init/bots.sql
mysql -uroot teamgram < init/channels.sql
mysql -uroot teamgram < init/configs.sql
mysql -uroot teamgram < init/countries.sql
mysql -uroot teamgram < init/country_codes.sql
mysql -uroot teamgram < init/emoji_keywords.sql
mysql -uroot teamgram < init/emoji_languages.sql
mysql -uroot teamgram < init/languages.sql
mysql -uroot teamgram < init/strings.sql
mysql -uroot teamgram < init/username.sql
mysql -uroot teamgram < init/users.sql
mysql -uroot teamgram < init/color_options.sql
mysql -uroot teamgram < init/timezones.sql
```
