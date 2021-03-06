class CreateGarbagePile < ActiveRecord::Migration[6.1]
  def change
    create_table :garbage_piles do |t|
      t.decimal :weight
      t.date :produced_at
      t.belongs_to :container
      t.belongs_to :user

      t.timestamps
    end
  end
end
