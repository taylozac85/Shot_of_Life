class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :remember_token, :string
    # add an index when you want to pull up a user by an attribute (in this case the remember_token)
    add_index  :users, :remember_token
  end
end
