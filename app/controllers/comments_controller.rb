class CommentsController < ApplicationController

  def create
    @comment = Comment.create(text: comment_params[:text], product_id: comment_params[:product_id], user_id: current_user.id)
  end

  private

  def comment_params
    params.permit(:text, :product_id)
  end
end
