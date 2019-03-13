class AddVolumeToCoinHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :coin_histories, :volume, :decimal
  end
end
