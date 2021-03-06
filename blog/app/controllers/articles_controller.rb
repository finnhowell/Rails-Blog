class ArticlesController < ApplicationController

    #http_basic_authenticate_with name: "user", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    #if article has comment do not destroy, else destroy
    if @article.comments.length > 0
      redirect_to articles_path, flash: { some_key: "You can't delete an article with comments." }
    else
      @article.destroy
      redirect_to articles_path
    end

  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
