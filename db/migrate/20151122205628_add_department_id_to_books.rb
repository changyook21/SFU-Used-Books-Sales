class AddDepartmentIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :department_id, :integer
  end
end
