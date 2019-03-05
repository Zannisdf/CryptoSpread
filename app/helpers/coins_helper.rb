module CoinsHelper
  def market_price(coin, market)
    CoinHistory.where(coin: coin, market: market).last.price.to_s
  end

  def hourly_price(coin)
    # 
    # replace group_by_hour with day
    # 
    quantities = coin.coin_histories.group_by_hour(:created_at).count
    quantities.map do |date, quantity|
      hourly_data = coin.coin_histories.where(created_at: date...(date + 1.hour))
      if quantity.zero?
        [date, 0]
      else
        [date, (hourly_data.pluck(:price).sum / quantity).round(2)]
      end
    end
  end
end
