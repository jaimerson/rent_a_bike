class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :user, index: true, foreign_key: true
      t.references :bike, index: true, foreign_key: true
      t.datetime :returned_at

      t.timestamps null: false
    end
  end
end
