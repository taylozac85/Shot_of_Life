# == Schema Information
#
# Table name: drinks
#
#  id             :integer          not null, primary key
#  drink_name     :string(255)
#  average_rating :float
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
