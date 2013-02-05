class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	# Adds database level check on uniqueness of email to avoid a new user hitting 'submit' 
  	# twice and bypassing our validates test to create duplicate accounts
  	# Also, adding an index to user_emial allows us to avoid a full-table scan when finding
  	# a user by their email address.
  	add_index :users, :user_email, unique: true
  end
end
