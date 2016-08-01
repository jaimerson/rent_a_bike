class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :name, null: false
      t.integer :model, null: false, default: 0
      t.decimal :price, null: false, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
