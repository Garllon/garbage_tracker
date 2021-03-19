# frozen_string_literal: true

class GraphsController < ApplicationController
  def index
    @graph_presenter = GraphPresenter.new(current_user.id)
  end
end
