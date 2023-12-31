class ArticlesController < ApplicationController
rescue_from ActiveRecord: :RecordInvalid, with: :render_unprocessable_entity_response

  def index
    articles = Article.all
    render json: articles, status: :ok
  end

  def show
    article = find_article
    render json: article
  end

  def create
    article = Article.create(article_params)
    render json: article, status: :created
  end

  def update
    article = find_article
    article.update(article_params)
    render json: article, status: :ok
  end

  def destroy

    article = find_article
    article.destroy
    head :no_content
  end

  

  private

  def find_article
    Article.find(params[:id])
  end

  def article_params
    params.permit(:firstname, :lastname, :email, :phonenumber, :message)
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
