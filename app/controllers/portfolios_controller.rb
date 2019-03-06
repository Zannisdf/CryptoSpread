class PortfoliosController < ApplicationController
  load_and_authorize_resource

  def index
    @portfolios = current_user.portfolios.where(follow: true)
  end

  def create
    @portfolio = Portfolio.find_or_create_by(
      user: current_user,
      coin_id: params[:coin_id]
    )
    @portfolio.follow = !@portfolio.follow
    if @portfolio.save
      respond_to :js
    else
      redirect_to root_path, alert: 'There was a problem, please try again.'
    end
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    @portfolio.follow = false
    if @portfolio.save
      respond_to :js
    else
      redirect_to root_path, alert: 'There was a problem, please try again.'
    end
  end
end
