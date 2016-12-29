class AddColumnToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :is_smoker, :boolean
 	  	add_column :listings, :is_internet, :boolean
 	  		add_column :listings, :is_pet, :boolean

  end
end
