class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :updated_at, :notes

  def notes
  	object.notes.pluck(:id)
  end
end
