class CoinHistory < ApplicationRecord
  belongs_to :coin
  belongs_to :market

  def self.hitbit_rates
    market = Market.find_by(name: 'HitBTC')
    base_url = 'https://api.hitbtc.com/api/2/public/ticker/'
    coin_symbols = %w[BTC ETH EOS LTC TRX ADA XMR IOTA DASH MKR NEO XEM ZEC ONT XTZ DOGE]
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
        volume: BigDecimal(data['volumeQuote']),
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
        volume: BigDecimal(data[sym_pair]['vol']),
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
        volume: coin_data['vol'].to_d,
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
        volume: BigDecimal(coin_data['quoteVolume']),
        currency: currency
      )
    end
  end

  def self.coinbene_rates
    market = Market.find_by(name: 'Coinbene')
    coin_symbols = %w[BTC ETH XRP EOS LTC TRX NEO]
    currency = 'USDT'
    base_url = 'http://api.coinbene.com/v1/market/ticker?symbol='
    coin_symbols.each do |sym|
      response = HTTParty.get(base_url + (sym + currency).downcase)
      coin_data = JSON.parse(response.body)['ticker'].first
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: BigDecimal(coin_data['last']),
        bid: BigDecimal(coin_data['bid']),
        ask: BigDecimal(coin_data['ask']),
        volume: BigDecimal(coin_data['24hrAmt']),
        currency: currency
      )
    end
  end

  def self.bittrex_rates
    market = Market.find_by(name: 'Bittrex')
    coin_symbols = %w[BTC ETH XRP LTC XLM TRX ADA XMR DASH NEO ZEC DOGE]
    currency = 'USDT'
    base_url = 'https://api.bittrex.com/api/v1.1/public/getmarketsummary?market='
    coin_symbols.each do |sym|
      response = HTTParty.get("#{base_url + currency}-#{sym}")
      coin_data = JSON.parse(response.body)['result']
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: coin_data['Last'].to_d,
        bid: coin_data['Bid'].to_d,
        ask: coin_data['Ask'].to_d,
        volume: coin_data['Volume'].to_d,
        currency: currency
      )
    end
  end

  def self.poloniex_rates
    market = Market.find_by(name: 'Poloniex')
    coin_symbols = %w[BTC ETH XRP EOS LTC XMR DASH ZEC DOGE]
    currency = 'USDT'
    response = HTTParty.get('https://poloniex.com/public?command=returnTicker')
    all_coin_data = JSON.parse(response.body)
    coin_symbols.each do |sym|
      coin_data = all_coin_data["#{currency}_#{sym}"]
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: BigDecimal(coin_data['last']),
        bid: BigDecimal(coin_data['highestBid']),
        ask: BigDecimal(coin_data['lowestAsk']),
        volume: BigDecimal(coin_data['baseVolume']),
        currency: currency
      )
    end
  end

  def self.okex_rates
    market = Market.find_by(name: 'OKEx')
    coin_symbols = %w[BTC ETH XRP EOS LTC XLM TRX ADA XMR IOTA DASH MKR NEO XEM ZEC ONT WAVES LINK]
    currency = 'USDT'
    base_url = 'https://www.okex.com/api/spot/v3/instruments/'
    coin_symbols.each do |sym|
      response = HTTParty.get("#{base_url + sym}-#{currency}/ticker")
      coin_data = JSON.parse(response.body)
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: BigDecimal(coin_data['last']),
        bid: BigDecimal(coin_data['bid']),
        ask: BigDecimal(coin_data['ask']),
        volume: BigDecimal(coin_data['quote_volume_24h']),
        currency: currency
      )
    end
  end

  def self.gateio_rates
    market = Market.find_by(name: 'Gate.io')
    coin_symbols = %w[BTC ETH XRP EOS LTC XLM TRX ADA XMR IOTA DASH MKR NEO XEM ZEC ONT XTZ WAVES DOGE LINK]
    base_url = 'https://data.gateio.co/api2/1/ticker/'
    currency = 'USDT'
    coin_symbols.each do |sym|
      pair = "#{sym}_#{currency}".downcase
      response = HTTParty.get(base_url + pair)
      coin_data = JSON.parse(response.body)
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(sym: sym),
        price: BigDecimal(coin_data['last']),
        bid: BigDecimal(coin_data['highestBid']),
        ask: BigDecimal(coin_data['lowestAsk']),
        volume: BigDecimal(coin_data['quoteVolume']),
        currency: currency
      )
    end
  end
end
