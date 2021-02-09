class BottleDepositConfigurationsController < ApplicationController
  def index
    @bottle_deposit_configurations = BottleDepositConfiguration.all
  end

  def new
    @bottle_deposit_configuration = BottleDepositConfiguration.new
  end

  def create
    BottleDepositConfiguration.create!(bottle_deposit_configuration_params)
    redirect_to bottle_deposit_configurations_path
  end

  def edit
    @bottle_deposit_configuration = BottleDepositConfiguration.find(params[:id])
  end

  def update
    bottle_deposit_configuration = BottleDepositConfiguration.find(params[:id])
    bottle_deposit_configuration.update!(bottle_deposit_configuration_params)
    redirect_to bottle_deposit_configurations_path
  end

  def destroy
    bottle_deposit_configuration = BottleDepositConfiguration.find(params[:id])
    bottle_deposit_configuration.delete
    redirect_to bottle_deposit_configurations_path
  end

  private

  def bottle_deposit_configuration_params
    params.require(:bottle_deposit_configuration).permit(:name, :price)
  end
end
