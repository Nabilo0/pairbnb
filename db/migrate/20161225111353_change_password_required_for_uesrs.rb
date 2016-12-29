class ChangePasswordRequiredForUesrs < ActiveRecord::Migration
  
  def self.down

  change_column_null :users, :true
  
  end
end


# aske about change_column_null :users , encrypted_password, true