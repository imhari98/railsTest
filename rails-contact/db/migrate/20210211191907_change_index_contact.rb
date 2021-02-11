class ChangeIndexContact < ActiveRecord::Migration[5.2]
  def change
    add_index :contacts, :phoneNumber, :unique =>  true
    #Ex:- add_index("admin_users", "username")
  end
end
