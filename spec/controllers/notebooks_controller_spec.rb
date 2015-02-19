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
    it "returns the notebook if it exists" do
      notebook = create(:notebook) 

      get :show, id: notebook
     
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      notebook_response = json['notebook']
      expect(notebook_response["title"]).to eq notebook.title
    end

    it "returns an error response if it doesn't exists" do
      get :show, id: 1000
     
      expect(response.status).to eq 404

      json = JSON.parse(response.body)
      expect(json["error"]).to eq "Notebook not found"
    end
  end


  describe "POST create" do
    it "saves a notebook" do
      notebook_attrs =  attributes_for(:notebook)
      
      post :create, notebook: notebook_attrs
     
      expect(response.status).to eq 200
      notebook = Notebook.last

      json = JSON.parse(response.body)
      notebook_response = json['notebook']
      expect(notebook_response["title"]).to eq notebook.title
      expect(response).to match_response_schema("notebook")
    end

    it "returns an error response when the title is blank" do
      unfound_notebook = create(:note)

      post :create, notebook: {title: "", description: "Nexus 5 all day"}
     
      expect(response.status).to eq 400

      json = JSON.parse(response.body)
      expect(json["errors"]).to eq "Title can't be blank"
    end
  end


  describe "PUT update" do
    let(:notebook) { create(:notebook) }
    it "updates a newbook" do   
      put :update, id: notebook.id, notebook: { title: "jQuery Rules!"}
     
      expect(response.status).to eq 200
      

      json = JSON.parse(response.body)
      notebook_response = json['notebook']
      expect(notebook_response["title"]).to eq "jQuery Rules!"
    end

    it "returns an error response when the title is blank" do
      put :update, id: notebook.id, notebook: { title: ""}
     
      expect(response.status).to eq 400

      json = JSON.parse(response.body)
      expect(json["errors"]).to eq "Title can't be blank"
    end
  end

  describe "DELETE destory" do
    let!(:notebook) { create(:notebook) }

    it "deletes a notebook when its found" do  
      expect { delete :destroy, id: notebook.id }.to change { Notebook.count }.by -1 
      expect(response.status).to eq 200  
    end

    it "returns an success response when a notebook is deleted" do
      delete :destroy, id: notebook.id 
     
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      expect(json["notebook"]).to eq "#{notebook.title} was deleted."
    end

    it "returns an error response when the notebook doesn't exists" do
      get :show, id: 1000
     
      expect(response.status).to eq 404

      json = JSON.parse(response.body)
      expect(json["error"]).to eq "Notebook not found"
    end
  end
end
