# frozen_string_literal: true

class Pile < ApplicationRecord
  belongs_to :container, optional: true
  belongs_to :user

  enum kind: %i[bio paper plastic waste]
  validates :produced_at, :weight, :kind, presence: true
  validates :weight, numericality: true

  before_save :calculate_real_weight

  def calculate_real_weight
    self.real_weight = container.present? ? weight - container.weight : weight
  end
end
