class ModifyUserSchema < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :email, false
    rename_column :users, :firstname, :first_name
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
    remove_column :users, :is_customer
    change_column_null :users, :is_admin, false
    change_column_default :users, :is_admin, false
    add_index :users, :email, unique: true    
  end
end
