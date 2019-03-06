module CoinsHelper
  def market_price(coin, market)
    CoinHistory.where(coin: coin, market: market).last.price.to_s
  end

  def time_frame(start_date = nil)
    current = Time.zone.now
    start_date = current - 24.hours if start_date.nil?
    [start_date, current]
  end
end
