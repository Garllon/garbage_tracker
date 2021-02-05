class CreateBottleDepositConfigurations < ActiveRecord::Migration[6.1]
  def change
    create_table :bottle_deposit_configurations do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
