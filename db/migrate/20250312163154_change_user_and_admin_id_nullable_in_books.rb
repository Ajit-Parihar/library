class ChangeUserAndAdminIdNullableInBooks < ActiveRecord::Migration[7.2]
  def change
      change_column_null :books, :user_id, true
      change_column_null :books, :Admin_id, true
    
  end
end
