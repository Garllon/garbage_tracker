class CreateBottleDepositStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :bottle_deposit_storages do |t|
      t.string :name
      t.integer :amount
      t.belongs_to :bottle_deposit,
        null: false,
        foreign_key: { to_table: :bottle_deposit_configurations }

      t.timestamps
    end
  end
end
