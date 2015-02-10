class NotesController < ApplicationController
	before_action :find_note, except: [:index, :create]

	def index
		notes = Note.all
		render json: notes, each_serializer: NoteSerializer
	end

	def show   
		render json: @note
	end

	def create
    note = Note.create(note_params)

    if note.valid?
      render json: note
    else
      render json: { errors: note.errors.full_messages.to_sentence }, status: 400
    end
  end

  def update
    @note.update(note_params)

    if @note.valid?
      render json: @note
    else
      render json: { errors: @note.errors.full_messages.to_sentence }, status: 400
    end
  end

  def destroy
  	note_title = @note.title
  	Note.find(@note).destroy
  	render json: { note: "#{note_title} was deleted."}
  end

	private 

  def find_note
    @note = Note.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
      render json: { error: 'Note not found' }, status: 404
  end

  def note_params
    params.require(:note).permit(:title, :body, :notebook_id) 
  end

end
