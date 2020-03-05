# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: [:show]
  before_action :set_current_person, except: [:show]
  before_action :authenticate_person!

  def index
    @people = Person.all.page params[:page]
  end

  def show
    if @person == current_person
      @drafts = @person.articles.where(publication: false)
    end
    @publications = @person.articles.where(publication: true).page params[:page]
  end

  def new
    @person = Person.new
  end

  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person updated.'
    else
      render :edit
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def set_current_person
    @person = current_person
  end

  def person_params
    params.require(:person).permit(:name, :email, :avatar, :last_name)
  end
end
