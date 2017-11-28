class PeopleController < ApplicationController
  before_action :find_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

  private

    def person_params
      params.require(:person).permit(:name, :age, :hair_color, :eye_color, :alive, :gender)
    end

    def find_person
      @person = Person.find(params[:id])
    end
end
