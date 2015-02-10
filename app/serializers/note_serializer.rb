class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body

  has_one :notebook
end
