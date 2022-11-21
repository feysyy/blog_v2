class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article_show = Article.find(params[:id])
  end 

  def new
    @article_new = Article.new
  end 

  def create
    new_article = Article.new(article_params)

    if new_article.save
      redirect_to new_article
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def edit
    @article_edit = Article.find(params[:id])
  end 
  
  def update
    update_article = Article.find(params[:id])

    if update_article.update(article_params)
      redirect_to update_article
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def destroy
    destroy_article = Article.find(params[:id])
    destroy_article.destroy

    redirect_to root_path
  end 

  private 

  def article_params
    params.require(:article).permit(:name, :body)
  end

end