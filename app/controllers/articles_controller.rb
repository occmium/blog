# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_person!, except: [:index]
  before_action :set_current_person_article, only: %i[edit update destroy]

  def index
    @articles = Article.all.where(publication: true).page params[:page]
  end

  def show; end

  def new
    @article = current_person.articles.build
  end

  def edit; end

  def create
    @article = current_person.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: 'Article created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article destroyed.'
  end

  def revote
    @article = Article.find(params[:article_id])

    unless @article.person == current_person
      if @article.get_upvotes.voters.include?(current_person)
        @article.downvote_by current_person
      else
        @article.upvote_by current_person
      end
    end

    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_current_person_article
    @article = current_person.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :person_id, :publication)
  end
end
