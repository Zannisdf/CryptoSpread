module PortfoliosHelper
  def followed?(user, coin)
    Portfolio.find_by(user: user, coin: coin, follow: true)
  end
end
