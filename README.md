#Crypto spread

http://www.cryptospread.net

RoR webapp for tracking cryptocurrency data (price, spread, volume) across markets. It fetches data directly from each market into the database.

You can fork the app to contribute or clone it if you'd like. To get the app running, follow these steps:

1. Create your database.

    rails db:create

2. Run migrations.

    rails db:migrate

3. Run seed.

    rails db:seed

This will create the coins and markets supported by the app, however you need to update your crontab in order to start fetching data:

4. Update Crontab

    whenever --update-crontab

5. Check your crontab

    crontab -l

You should see a runner job for each market plus one for `update_ban`.

That's it!