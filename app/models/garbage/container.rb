# frozen_string_literal: true

module Garbage
  class Container < ApplicationRecord
    self.table_name = 'garbage_containers'

    has_many :pills
    belongs_to :user

    validates :name, :weight, presence: true
    validates :weight, numericality: true
  end
end
