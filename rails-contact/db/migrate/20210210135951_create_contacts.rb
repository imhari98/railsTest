class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :firstName,              null: false, default: ""
      t.string :lastName,              null: false
      t.integer :phoneNumber,              null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :address,              null: true
      t.boolean :favourite,              null: true, default: false
      t.timestamps
    end
  end
end
