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
      if user_signed_in?
        redirect_to root_path, alert: 'There has been an error, please try again.'
      else
        redirect_to new_user_session_path, notice: 'You must be logged in first'
      end
      respond_to :html
    end
  end
end
