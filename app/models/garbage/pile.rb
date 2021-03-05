# frozen_string_literal: true

module Garbage
  class Pile < ApplicationRecord
    enum type: [:bio, :paper, :plastik, :waste]

    self.table_name = 'garbage_piles'
    belongs_to :container
    belongs_to :user
  end
end
