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

    it "returns an error response if it doesn't exists" do
      unfound_notebook = create(:note)

      get :show, id: unfound_notebook
     
      expect(response.status).to eq 404

      json = JSON.parse(response.body)
      expect(json["error"]).to eq "Notebook not found"
    end
  end


  describe "POST create" do
    it "saves a newbook" do
      notebook_attrs =  attributes_for(:notebook)
      
      post :create, notebook: notebook_attrs
     
      expect(response.status).to eq 200
      notebook = Notebook.last

      json = JSON.parse(response.body)
      notebook_response = json['notebook']
      expect(notebook_response["title"]).to eq notebook.title
    end

    it "returns an error response when the title is blank" do
      unfound_notebook = create(:note)

      post :create, notebook: {title: "", description: "Nexus 5 all day"}
     
      expect(response.status).to eq 400

      json = JSON.parse(response.body)
      expect(json["errors"]).to eq "Title can't be blank"
    end
  end
end
