class NotebookSideLoadSerializer < ActiveModel::Serializer
	embed :ids, :include => true
  attributes :id, :title, :description, :created_at, :updated_at

  has_many :notes
end


