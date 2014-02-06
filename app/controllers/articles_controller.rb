class ArticlesController < ApplicationController

def index

@articles=Article.all.paginate(:page => params[:page], :per_page => 2)

@comment=Comment.all
end
def new
@article=Article.new
	end
def show
 @article=Article.find(params[:id])
end
def edit
  @article=Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    @article.title=params[:article][:title]
    @article.body=params[:article][:body]
    respond_to do |format|

      if @article.update(article_params)
        format.html { redirect_to articles_path , notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @articles.errors, status: :unprocessable_entity }
      end
    end
  end

def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.body=params[:article][:body]

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  	@article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
    # Use callbacks to share common setup or constraints between actions.
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params[:article]
    end
    def article_params
      params.require(:article).permit(:title, :user_id, :body, :article_id)
    end

end
