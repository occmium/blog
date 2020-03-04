# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_article, only: %i[create destroy]
  before_action :set_comment, only: [:destroy]

  def create
    if @article.publication == true
      @new_comment = @article.comments.build(comment_params)
    end
    @new_comment.person = current_person
    if @new_comment.save
      redirect_to @article, notice: 'Comment created.'
    else
      render 'articles/show'
    end
  end

  def destroy
    if current_person_can_edit?(@comment) || current_person_can_edit?(@article)
      @comment.destroy
      redirect_to @article, notice: 'Comment destroyed.'
    else
      render text: 'ERROR'
    end
  end

  def revote
    @comment = Comment.find(params[:comment_id])

    unless @comment.person == current_person
      if @comment.get_upvotes.voters.include?(current_person)
        @comment.downvote_by current_person
      else
        @comment.upvote_by current_person
      end
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
