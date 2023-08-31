class ArticlesController < ApplicationController

  def index
    articles = Article.all
    render json: articles status: :ok
  end

  def show
    article = find_article
    render json: article
  end

  def create
    article = Article.create(article_params)
    render json: article status: :created
  end

  def update
    article = find_article
    article.update(article_params)
    render json: article status: :ok
  end

  

  private

  def find_article
    Article.find(params[:id])
  end

  def article_params
    params.permit(:firstname, :lastname, :email, :phonenumber, :message)
  end

end
