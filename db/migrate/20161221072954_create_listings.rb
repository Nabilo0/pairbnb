class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

      t.belongs_to :user, index: true
      
      t.string :property_name
      t.integer :stars
      t.string :address
      t.integer :room_number
      t.integer :price

      t.timestamps null: false
    end
  end
end
