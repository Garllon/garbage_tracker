# frozen_string_literal: true

class ChangeWeightType < ActiveRecord::Migration[6.1]
  def change
    change_column :containers, :weight, :integer
    change_column :piles, :weight, :integer
  end
end
