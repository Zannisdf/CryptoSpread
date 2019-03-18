class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end

  def show
    @coin = Coin.find(params[:id])
    @markets = @coin.markets.uniq
    @comment = Comment.new
    @comments = @coin.comments.order('created_at DESC')
  end

  def chart_data
    @coin = Coin.find(params[:id])
    render json: @coin.chart_data
  end
end
