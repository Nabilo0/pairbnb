class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :password
      t.string :gender
      t.string :identity
      t.integer :phone_number
      t.string :currency

      t.timestamps null: false
    end
  end
end
