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

require 'rails_helper'

RSpec.describe Notebook, type: :model do
	it { should have_many(:notes) }
  it { should validate_presence_of(:title) }
end
