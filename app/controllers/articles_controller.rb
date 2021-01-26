class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @user= current_user
  end

  def show
    @article = Article.find(params[:id])
    @user = current_user
  end
  def my
  	@article= Article.find(current_user.id)
  end	
  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.save()
	  redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end
  	
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
