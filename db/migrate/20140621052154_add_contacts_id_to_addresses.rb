class AddContactsIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :contacts_id, :integer
  end
end
