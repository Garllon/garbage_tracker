# frozen_string_literal: true

module BottleDeposit
  class ConfigurationsController < ApplicationController
    def index
      @configurations = Configuration.all
    end

    def new
      @configuration = Configuration.new
    end

    def create
      Configuration.create!(configuration_params)
      redirect_to bottle_deposit_configurations_path
    end

    def edit
      @configuration = Configuration.find(params[:id])
    end

    def update
      configuration = Configuration.find(params[:id])
      configuration.update!(configuration_params)
      redirect_to bottle_deposit_configurations_path
    end

    def destroy
      configuration = Configuration.find(params[:id])
      configuration.delete
      redirect_to bottle_deposit_configurations_path
    end

    private

    def configuration_params
      params.require(:bottle_deposit_configuration).permit(:name, :price)
    end
  end
end
