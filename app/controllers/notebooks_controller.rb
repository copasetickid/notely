class NotebooksController < ApplicationController
	before_action :find_notebook, only: [:show, :update]
	
	def index
		notebooks = Notebook.all
		render json: notebooks, each_serializer: NotebookSerializer
	end

	def show   
		render json: @notebook
	end

  def create
    notebook = Notebook.create(notebook_params)

    if notebook.valid?
      render json: notebook
    else
      render json: { errors: notebook.errors.full_messages.to_sentence }, status: 400
    end
  end

  def update
    @notebook.update(notebook_params)

    if @notebook.valid?
      render json: @notebook
    else
      render json: { errors: @notebook.errors.full_messages.to_sentence }, status: 400
    end
  end


  private 

  def find_notebook
    @notebook = Notebook.find(params[:id])
    rescue ActiveRecord::RecordNotFound 
      render json: { error: 'Notebook not found' }, status: 404
    
  end

  def notebook_params
    params.require(:notebook).permit(:title, :description) 
  end
end
