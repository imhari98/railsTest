class RemoveUnique < ActiveRecord::Migration[5.2]
  def change
    remove_index :contacts, :phoneNumber
  end
end
