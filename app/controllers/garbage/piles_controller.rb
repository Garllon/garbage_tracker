# frozen_string_literal: true

module Garbage
  class PilesController < ApplicationController
    before_action :authenticate_user!

    def index
      @piles = Pile.includes(:container).where(user_id: current_user.id)
    end
  end
end
