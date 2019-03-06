module PortfoliosHelper
  def followed?(coin)
    Portfolio.find_by(user: current_user, coin: coin, follow: true)
  end
end
