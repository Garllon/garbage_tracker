# frozen_string_literal: true

class PilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pile, only: %w[edit update destroy]
  before_action only: %w[edit update destroy] do
    authorize_user_pundit_rights(@pile)
  end

  def index
    @piles = Pile.includes(:container)
                 .where(user_id: current_user.id)
                 .order('produced_at DESC')
  end

  def new
    @pile = Pile.new(produced_at: Time.now.strftime('%Y-%m-%d'))
  end

  def create
    @pile = Pile.new(pile_params)

    if @pile.save
      redirect_to piles_path, notice: t('.success')
    else
      flash[:alert] = @pile.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @pile.update(pile_params)
      redirect_to piles_path, notice: t('.success')
    else
      flash[:alert] = @pile.errors.full_messages
      render :edit
    end
  end

  def destroy
    @pile.delete
    redirect_to piles_path
  end

  private

  def find_pile
    @pile = Pile.find(params[:id])
  end

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
