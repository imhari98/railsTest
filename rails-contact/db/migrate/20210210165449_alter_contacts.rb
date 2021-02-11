class AlterContacts < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :lastName, :string, {null: false, default: ""}
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
