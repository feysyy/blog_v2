class CommentsController < ApplicationController
  before_action :get_article

  def new
    @comment = @article.comments.build
  end 
  
  def create
    comment = @article.comments.create(comment_params)
    if comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end 

  def edit
    @comment = @article.comments.find(params[:id])
  end

  def update
    comment = @article.comments.find(params[:id])

    if comment.update(comment_params)
      redirect_to article_path(@article), {notice: "Comment updated!"}
    else
      render :edit
    end
  end


  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    
    redirect_to article_path(@article), {notice: "Comment deleted!"}
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end

end