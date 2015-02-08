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

require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should validate_presence_of(:title) }
  it { should belong_to(:notebook) }
end
