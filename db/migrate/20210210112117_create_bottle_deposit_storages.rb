class CreateBottleDepositStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :bottle_deposit_storages do |t|

      t.timestamps
    end
  end
end
