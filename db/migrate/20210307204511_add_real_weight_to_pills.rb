# frozen_string_literal: true

class AddRealWeightToPills < ActiveRecord::Migration[6.1]
  def change
    add_column :garbage_piles, :real_weight, :integer
  end
end
