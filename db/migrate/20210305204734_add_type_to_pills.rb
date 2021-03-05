class AddTypeToPills < ActiveRecord::Migration[6.1]
  def change
    add_column :garbage_piles, :type, :integer
  end
end
