class AddFieldsToCoinHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :coin_histories, :bid, :decimal
    add_column :coin_histories, :ask, :decimal
  end
end
