class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.date :review_date
      t.integer :rating
      t.text :review
      t.integer :user_id
      t.integer :drink_id

      t.timestamps
    end
  end
end
