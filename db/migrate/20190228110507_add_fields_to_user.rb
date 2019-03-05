class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :integer, default: 1
    add_column :users, :ban, :integer, default: 0
  end
end
