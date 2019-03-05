class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      user: current_user,
      coin_id: params[:coin_id],
      content: params[:comment][:content]
    )
    if @comment.save
      respond_to :js
    else
      redirect_to root_path, alert: 'There has been an error, please try again.'
    end
  end
end
