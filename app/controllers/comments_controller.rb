class CommentsController < ApplicationController

def index
@comment=Comment.all
end

def create
@comment = Comment.new
@comment.comment =params[:comment][:comment]
    @comment.user_id = params[:comment][:user_id]
    @comment.article_id = params[:comment][:article_id]
    @comment.save
    redirect_to articles_path
end
def edit 
@comment=Comment.find(params[:id])
end
def show
	@comment=Comment.find(params[:id])
end
def update
 @comment=Comment.find(params[:id])
    # @comment.user_id=params[:comment][:user_id] 
    # @comment.article_id=params[:comment][:article_id]
    @comment.comment=params[:comment][:comment]
    respond_to do |format|

      if @comment.update(comment_params)
        format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  	@comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

	def comment_params
      params.require(:comment).permit(:comment, :user_id,:article_id)
  end
end
