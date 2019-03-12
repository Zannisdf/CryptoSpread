# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# set :environment, 'development'

every 1.minute do
  runner 'CoinHistory.hitbit_rates', environment: 'development'
  runner 'CoinHistory.zb_rates', environment: 'development'
  runner 'CoinHistory.bitforex_rates', environment: 'development'
  runner 'CoinHistory.binance_rates', environment: 'development'
  runner 'CoinHistory.coinbene_rates', environment: 'development'
  runner 'CoinHistory.bittrex_rates', environment: 'development'
  runner 'CoinHistory.poloniex_rates', environment: 'development'
  runner 'CoinHistory.okex_rates', environment: 'development'
  runner 'CoinHistory.gateio_rates', environment: 'development'
end

every 1.day, at: '1:00 am' do
  runner 'User.update_ban'
end
