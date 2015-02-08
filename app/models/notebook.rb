# == Schema Information
#
# Table name: notebooks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Notebook < ActiveRecord::Base
	has_many :notes, dependent: :destroy
  
  validates_presence_of :title
end
