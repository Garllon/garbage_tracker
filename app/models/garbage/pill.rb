# frozen_string_literal: true

module Garbage
  class Pill < ApplicationRecord
    self.table_name = 'garbage_pills'
    belongs_to :container
    belongs_to :user
  end
end
