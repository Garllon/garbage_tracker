# frozen_string_literal: true

class PilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @piles = Pile.includes(:container).where(user_id: current_user.id)
  end

  def new
    @pile = Pile.new
  end

  def create
    pile = Pile.new(pile_params)

    if pile.save
      redirect_to piles_path, notice: t('.success')
    else
      redirect_to piles_path(pile), alert: pile.errors.full_messages
    end
  end

  def edit
    @pile = Pile.find(params[:id])
  end

  def update
    pile = Pile.find(params[:id])
    if pile.update(pile_params)
      redirect_to piles_path, notice: t('.success')
    else
      redirect_to piles_path(pile), alert: pile.errors.full_messages
    end
  end

  def destroy
    pile = Pile.find(params[:id])
    pile.delete
    redirect_to piles_path
  end

  private

  def pile_params
    pile_params = params.require(:pile)
                        .permit(:weight,
                                :kind,
                                :container_id,
                                :produced_at)
    pile_params[:user_id] = current_user.id
    pile_params
  end
end
