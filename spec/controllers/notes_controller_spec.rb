require 'rails_helper'

RSpec.describe NotesController, type: :controller do
	describe "GET index" do
    it "renders all the notes when they exist" do
      create_list(:note, 5) 

      get :index
     
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      expect(json['notes'].length).to_not eq 0
    end
  end

  describe "GET show" do
    it "returns the book if it exists" do
      note = create(:note) 

      get :show, id: note
     
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      note_response = json['note']
      expect(note_response["title"]).to eq note.title
    end

    it "returns an error response if it doesn't exists" do
      get :show, id: 1000
     
      expect(response.status).to eq 404

      json = JSON.parse(response.body)
      expect(json["error"]).to eq "Note not found"
    end
  end


  describe "POST create" do
    it "saves a newbook" do
      note_attrs =  attributes_for(:note)
      
      post :create, note: note_attrs
     
      expect(response.status).to eq 200
      note = Note.last

      json = JSON.parse(response.body)
      note_response = json['note']
      expect(note_response["title"]).to eq note.title
    end

    it "returns an error response when the title is blank" do
      post :create, note: {title: "", body: "Nexus 5 all day"}
     
      expect(response.status).to eq 400

      json = JSON.parse(response.body)
      expect(json["errors"]).to eq "Title can't be blank"
    end
  end


  describe "PUT update" do
    let(:note) { create(:note) }
    it "updates a note" do   
      put :update, id: note.id, note: { title: "jQuery Rules!"}
     
      expect(response.status).to eq 200
      
      json = JSON.parse(response.body)
      note_response = json['note']
      expect(note_response["title"]).to eq "jQuery Rules!"
    end

    it "returns an error response when the title is blank" do
      put :update, id: note.id, note: { title: ""}
     
      expect(response.status).to eq 400

      json = JSON.parse(response.body)
      expect(json["errors"]).to eq "Title can't be blank"
    end
  end

  describe "DELETE destory" do
    let!(:note) { create(:note) }

    it "deletes a note when its found" do  
      expect { delete :destroy, id: note.id }.to change { Note.count }.by -1 
      expect(response.status).to eq 200  
    end

    it "returns an success response when a note is deleted " do
      delete :destroy, id: note.id 
     
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      expect(json["note"]).to eq "#{note.title} was deleted."
    end

    it "returns an error response when the note doesn't exists" do
      get :show, id: 1000
     
      expect(response.status).to eq 404

      json = JSON.parse(response.body)
      expect(json["error"]).to eq "Note not found"
    end
  end
end
