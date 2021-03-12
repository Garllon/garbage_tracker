# frozen_string_literal: true

class ContainersController < ApplicationController
  before_action :authenticate_user!

  def index
    @containers = Container.where(user_id: current_user.id)
  end

  def new
    @container = Container.new
  end

  def create
    @container = Container.new(container_params)

    if @container.save
      redirect_to containers_path, notice: t('.success')
    else
      flash[:alert] = @container.errors.full_messages
      render :new
    end
  end

  def edit
    @container = Container.find(params[:id])
  end

  def update
    @container = Container.find(params[:id])

    if @container.update(container_params)
      redirect_to containers_path, notice: t('.success')
    else
      flash[:alert] = @container.errors.full_messages
      render :edit
    end
  end

  def destroy
    container = Container.find(params[:id])
    container.delete
    redirect_to containers_path
  end

  private

  def container_params
    container_params = params
                       .require(:container)
                       .permit(:name, :weight)
    container_params[:user_id] = current_user.id
    container_params
  end
end
