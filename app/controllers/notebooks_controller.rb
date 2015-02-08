class NotebooksController < ApplicationController
	before_action :find_notebook, only: [:show]
	
	def index
		notebooks = Notebook.all
		render json: notebooks, each_serializer: NotebookSerializer
	end

	def show
		render json: @notebook
	end


  private 

  def find_notebook
    @notebook = Notebook.find(params[:id])
  end

  def notebook_params
    params.require(:notebook).permit(:title, :description) 
  end
end
