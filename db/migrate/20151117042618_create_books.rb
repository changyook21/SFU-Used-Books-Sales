class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :cname
      t.integer :cnumber
      t.string :quality
      t.string :publisher
      t.string :campus
      t.integer :price

      t.timestamps null: false
    end
  end
end
