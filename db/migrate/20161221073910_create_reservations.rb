class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|

    	t.belongs_to :user, index: true
    	t.belongs_to :listing, index: true

      t.integer :total_price
      t.date :date_start
      t.date :date_end

      t.timestamps null: false
    end
  end
end
