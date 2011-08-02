class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :lists
  end
end
