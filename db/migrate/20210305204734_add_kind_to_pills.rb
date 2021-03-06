class AddKindToPills < ActiveRecord::Migration[6.1]
  def change
    add_column :garbage_piles, :kind, :integer
  end
end
