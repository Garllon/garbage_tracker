# frozen_string_literal: true

class Container < ApplicationRecord
  has_many :pills
  belongs_to :user

  validates :name, :weight, presence: true
  validates :weight, numericality: true
end
