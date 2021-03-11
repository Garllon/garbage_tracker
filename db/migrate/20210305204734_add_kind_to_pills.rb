# frozen_string_literal: true

class AddKindToPills < ActiveRecord::Migration[6.1]
  def change
    add_column :piles, :kind, :integer
  end
end
