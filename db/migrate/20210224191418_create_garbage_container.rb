class CreateGarbageContainer < ActiveRecord::Migration[6.1]
  def change
    create_table :garbage_containers do |t|
      t.string :name
      t.decimal :weight
      t.belongs_to :user

      t.timestamps
    end
  end
end
