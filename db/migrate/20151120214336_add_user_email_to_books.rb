class AddUserEmailToBooks < ActiveRecord::Migration
  def change
    add_column :books, :user_email, :string
  end
end
