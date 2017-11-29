class NotesController < ApplicationController
  before_action :find_person

  def create
    @note = @person.notes.create(note_params)
    redirect_to person_path(@person)
  end

  def destroy
    @note = @person.notes.find(params[:id])
    @note.destroy
    redirect_to person_path(@person)
  end

  private

    def find_person
      @person = Person.find(params[:person_id])
    end

    def note_params
      params.require(:note).permit(:author, :body, :person_id)
    end
end
