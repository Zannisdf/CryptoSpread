class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.coin_id = params[:coin_id]
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

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
