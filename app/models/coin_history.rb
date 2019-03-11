class CoinHistory < ApplicationRecord
  belongs_to :coin
  belongs_to :market

  def self.hitbit_rates
    market = Market.find_by(name: 'Hitbit')
    base_url = 'https://api.hitbtc.com/api/2/public/ticker/'
    coin_symbols = %w[BTC ETH XRP EOS LTC SLM TRX ADA XMR IOTA DASH MKR NEO XEM ZEC ONT XTZ DOGE]
    currency = 'USD'
    coin_symbols.each do |sym|
      response = HTTParty.get(base_url + sym + currency)
      data = JSON.parse(response.body)
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: BigDecimal(data['last']),
        bid: BigDecimal(data['bid']),
        ask: BigDecimal(data['ask']),
        currency: currency
      )
    end
  end

  def self.zb_rates
    market = Market.find_by(name: 'ZB')
    coin_symbols = %w[BTC ETH XRP EOS LTC XLM ADA DASH NEO XEM XTZ DOGE]
    currency = 'USDT'
    response = HTTParty.get('http://api.zb.cn/data/v1/allTicker')
    data = JSON.parse(response.body)
    coin_symbols.each do |sym|
      sym_pair = (sym + currency).downcase
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: BigDecimal(data[sym_pair]['last']),
        bid: BigDecimal(data[sym_pair]['buy']),
        ask: BigDecimal(data[sym_pair]['sell']),
        currency: currency
      )
    end
  end

  def self.bitforex_rates
    market = Market.find_by(name: 'BitForex')
    coin_symbols = %w[BTC ETH XRP EOS LTC XLM TRX DASH NEO DOGE]
    currency = 'USDT'
    base_url = 'https://api.bitforex.com/api/v1/market/ticker?symbol='
    coin_symbols.each do |sym|
      pair = "#{currency}-#{sym}".downcase
      response = HTTParty.get("#{base_url}coin-#{pair}")
      coin_data = JSON.parse(response.body)['data']
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: coin_data['last'].to_d,
        bid: coin_data['buy'].to_d,
        ask: coin_data['sell'].to_d,
        currency: currency
      )
    end
  end

  def self.binance_rates
    market = Market.find_by(name: 'Binance')
    coin_symbols = %w[BTC ETH XRP EOS LTC XLM TRX ADA IOTA NEO ONT WAVES LINK]
    currency = 'USDT'
    base_url = 'https://api.binance.com/api/v1/ticker/24hr?symbol='
    coin_symbols.each do |sym|
      response = HTTParty.get(base_url + sym + currency)
      coin_data = JSON.parse(response.body)
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: BigDecimal(coin_data['lastPrice']),
        bid: BigDecimal(coin_data['bidPrice']),
        ask: BigDecimal(coin_data['askPrice']),
        currency: currency
      )
    end
  end
end
