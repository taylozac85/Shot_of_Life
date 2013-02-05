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

class Drink < ActiveRecord::Base
  attr_accessible :average_rating, :description, :drink_name
  
  has_many :reviews

  validates :description, :length => { :in => 1..1000 }
  validates :average_rating, :description, :drink_name, :presence => true
end
