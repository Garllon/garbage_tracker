# frozen_string_literal: true

module Garbage
  class PilesController < ApplicationController
    before_action :authenticate_user!

    def index
      @piles = Pile.includes(:container).where(user_id: current_user.id)
    end

    def new
      @pile = Pile.new
    end

    def create
      Pile.create!(pile_params)
      redirect_to garbage_piles_path
    end

    def edit
      @pile = Pile.find(params[:id])
    end

    def update
      pile = Pile.find(params[:id])
      pile.update!(pile_params)
      redirect_to garbage_piles_path
    end

    def destroy
      pile = Pile.find(params[:id])
      pile.delete
      redirect_to garbage_piles_path
    end

    private

    def pile_params
      pile_params = params.require(:garbage_pile)
                          .permit(:weight,
                                  :kind,
                                  :container_id,
                                  :produced_at)
      pile_params[:user_id] = current_user.id
      pile_params
    end
  end
end
