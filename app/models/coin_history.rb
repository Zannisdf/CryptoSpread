class CoinHistory < ApplicationRecord
  belongs_to :coin
  belongs_to :market

  def self.hitbit_rates
    market = Market.find_by(name: 'Hitbit')
    base_url = 'https://api.hitbtc.com/api/2/public/ticker/'
    coin_symbols = {
      BTCUSD: 'Bitcoin',
      ETHUSD: 'Ethereum',
      XRPUSDT: 'XRP',
      EOSUSD: 'EOS',
      LTCUSD: 'Litecoin'
    }
    coin_symbols.each do |coin_symbol, coin_name|
      response = HTTParty.get(base_url + coin_symbol.to_s)
      data = JSON.parse(response.body)
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(name: coin_name),
        price: BigDecimal(data['last']),
        currency: 'usdt'
      )
    end
  end

  def self.zb_rates
    market = Market.find_by(name: 'ZB')
    coin_symbols = {
      btcusdt: 'Bitcoin',
      ethusdt: 'Ethereum',
      xrpusdt: 'XRP',
      eosusdt: 'EOS',
      ltcusdt: 'Litecoin'
    }
    response = HTTParty.get('http://api.zb.cn/data/v1/allTicker')
    data = JSON.parse(response.body)
    coin_symbols.each do |coin_symbol, coin_name|
      CoinHistory.create(
        market: market,
        coin: Coin.find_by(name: coin_name),
        price: BigDecimal(data[coin_symbol.to_s]['last']),
        currency: 'usdt'
      )
    end
  end
end
