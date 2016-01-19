class AddUserUsernameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_username, :string
  end
end
