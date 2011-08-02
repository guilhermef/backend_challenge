class CreateContactsLists < ActiveRecord::Migration
  def self.up
    create_table :contacts_lists, :id => false do |t|
      t.integer :contact_id
      t.integer :list_id
    end
  end

  def self.down
    drop_table :contacts_lists
  end
end