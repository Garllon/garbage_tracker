# frozen_string_literal: true

module ApplicationHelper
  FLASH_LEVEL = {
    'notice' => 'alert-info',
    'alert' => 'alert-danger'
  }.freeze

  WASTE_BACKGROUND_COLOR = {
    'paper' => 'primary',
    'waste' => 'dark',
    'plastic' => 'warning'
  }.freeze

  def flash_class(level)
    "alert #{FLASH_LEVEL[level]}"
  end

  def row_background_color(waste_kind)
    "table-#{WASTE_BACKGROUND_COLOR[waste_kind]}"
  end
end
