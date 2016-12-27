class ChangePasswordRequiredForUesrs < ActiveRecord::Migration
  
  def self.down

  change_column_null :users, :true
  
  end
end
