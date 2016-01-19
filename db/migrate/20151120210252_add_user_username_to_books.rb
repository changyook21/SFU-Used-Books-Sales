class AddUserUsernameToBooks < ActiveRecord::Migration
  def change
    add_column :books, :user_username, :string
  end
end
