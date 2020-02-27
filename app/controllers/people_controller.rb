class PeopleController < ApplicationController
  before_action :set_person, only: [:show]
  before_action :set_current_person, except: [:show]
  before_action :authenticate_person!, except: [:show]

  def index
    @people = Person.all
  end

  def show
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
      params.require(:person).permit(:name, :email)
    end
end