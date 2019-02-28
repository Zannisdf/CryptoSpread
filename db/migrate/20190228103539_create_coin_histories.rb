class CreateCoinHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :coin_histories do |t|
      t.references :coin, foreign_key: true
      t.references :market, foreign_key: true
      t.decimal :price
      t.string :currency

      t.timestamps
    end
  end
end
