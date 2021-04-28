# frozen_string_literal: true

class GraphsController < ApplicationController
  before_action :authenticate_user!

  def index
    @date = Date.today
    @graph_presenter = GraphPresenter.new(current_user.id)
  end
end
