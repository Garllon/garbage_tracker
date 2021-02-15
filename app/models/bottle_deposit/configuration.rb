# frozen_string_literal: true

module BottleDeposit
  class Configuration < ApplicationRecord
    self.table_name = 'bottle_deposit_configurations'
    has_many :storages
  end
end
