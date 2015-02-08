# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  notebook_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :note do
    title  "Functions"
    body "Hey Hey Hey"
    notebook
  end
end
