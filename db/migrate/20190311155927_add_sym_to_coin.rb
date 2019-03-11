class AddSymToCoin < ActiveRecord::Migration[5.2]
  def change
    add_column :coins, :sym, :string
  end
end
