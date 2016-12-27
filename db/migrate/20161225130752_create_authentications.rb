class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :token
      t.string :provider
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end


      # t.references :user_id, index: true, foreign_key: true
