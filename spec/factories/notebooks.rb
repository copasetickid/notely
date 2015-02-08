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

FactoryGirl.define do
  factory :notebook do
    sequence(:title) {|n| "JavaScript Journey-#{n}" }
  end
end
