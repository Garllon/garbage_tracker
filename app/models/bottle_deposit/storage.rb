# frozen_string_literal: true

module BottleDeposit
  class Storage < ApplicationRecord
    self.table_name = 'bottle_deposit_storages'
    belongs_to :configuration, foreign_key: :bottle_deposit_id
  end
end
