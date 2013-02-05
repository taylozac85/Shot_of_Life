class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :drink_name
      t.float :average_rating
      t.text :description

      t.timestamps
    end
  end
end
