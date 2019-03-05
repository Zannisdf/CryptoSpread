module CoinsHelper
  def market_price(coin, market)
    CoinHistory.where(coin: coin, market: market).last.price.to_s
  end
end
