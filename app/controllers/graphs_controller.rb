# frozen_string_literal: true

class GraphsController < ApplicationController
  before_action :authenticate_user!

  def index
    @graph_presenter = GraphPresenter.new(current_user.id)
  end
end
