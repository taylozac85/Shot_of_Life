# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  review_date :date
#  rating      :integer
#  review      :text
#  user_id     :integer
#  drink_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  attr_accessible :rating, :review
  belongs_to :user
  belongs_to :drink

  validates :review, :length => { :maximum => 500 }
  validates :review, :user_id, :presence => true

  # orders the reviews by when they were created, with most recent being first.
  # 'DESC' is SQL for 'descending'
  default_scope :order => 'reviews.created_at DESC'
end
