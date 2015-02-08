require 'rails_helper'

RSpec.describe NotebooksController, type: :controller do
	describe "GET index" do
    it "renders all the notes when they exist" do
      create_list(:notebook, 5) 

      get :index
     
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      expect(json['notebooks'].length).to_not eq 0
    end
  end

  describe "GET show" do
    it "returns the book if it exists" do
      notebook = create(:notebook) 

      get :show, id: notebook
     
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      notebook_response = json['notebook']

      expect(notebook_response["title"]).to eq notebook.title
    end
  end
end
