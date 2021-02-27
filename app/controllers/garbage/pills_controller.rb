# frozen_string_literal: true

module Garbage
  class PillsController < ApplicationController
    before_action :authenticate_user!
  end
end
