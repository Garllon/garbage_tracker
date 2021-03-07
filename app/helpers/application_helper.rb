# frozen_string_literal: true

module ApplicationHelper
  FLASH_LEVEL = {
    'notice' => 'alert-info',
    'success' => 'alert-success',
    'error' => 'alert-danger'
  }.freeze

  def flash_class(level)
    "alert #{FLASH_LEVEL[level]}"
  end
end
