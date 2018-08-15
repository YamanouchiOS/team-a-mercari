class CommentsController < ApplicationController

  def create
    @comment = Comment.create(text: comment_params[:text], product_id: comment_params[:product_id], user_id: current_user.id)
    redirect_to product_path(params[:product_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(product_id: params[:product_id])
  end
end
