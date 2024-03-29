# frozen_string_literal: true

module ApplicationHelper
  FLASH_LEVEL = {
    'notice' => 'alert-info',
    'alert' => 'alert-danger'
  }.freeze

  def flash_class(level)
    "alert #{FLASH_LEVEL[level]}"
  end

  def kind_sign(waste_kind)
    "#{waste_kind}-sign rounded text-center"
  end
end
