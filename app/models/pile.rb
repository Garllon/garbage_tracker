# frozen_string_literal: true

class Pile < ApplicationRecord
  belongs_to :container
  belongs_to :user

  enum kind: %i[bio paper plastic waste]
  validates :produced_at, presence: true
  validates :weight, presence: true

  before_save :calculate_real_weight

  def calculate_real_weight
    self.real_weight = weight - container.weight
  end
end
