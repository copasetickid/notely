class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :notebook

  def notebook
  	object.notebook.id
  end
end
