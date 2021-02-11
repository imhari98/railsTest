class Changeuser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fullName, :string, {null: false, default: ""}
    add_column :users, :userName, :string, {null: false, default: ""}
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
