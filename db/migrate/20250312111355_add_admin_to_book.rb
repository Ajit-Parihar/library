class AddAdminToBook < ActiveRecord::Migration[7.2]
  def change
    add_reference :books, :Admin, null: false, foreign_key: true
  end
end
