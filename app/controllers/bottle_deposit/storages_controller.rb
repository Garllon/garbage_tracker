# frozen_string_literal: true

module BottleDeposit
  class StoragesController < ApplicationController
    def index
      @storages = Storage.includes(:configuration)
    end

    def new
      @storage = Storage.new
    end

    def create
      Storage.create!(storage_params)
      redirect_to bottle_deposit_storages_path
    end

    def edit
      @storage = Storage.find(params[:id])
    end

    def update
      storage = Storage.find(params[:id])
      storage.update!(storage_params)
      redirect_to bottle_deposit_storages_path
    end

    def destroy
      storage = Storage.find(params[:id])
      storage.delete
      redirect_to bottle_deposit_storages_path
    end

    private

    def storage_params
      storage_params = params
                       .require(:bottle_deposit_storage)
                       .permit(:name, :amount, :bottle_deposit_configuration_id)
      storage_params[:bottle_deposit_id] =
        storage_params.delete(:bottle_deposit_configuration_id)
      storage_params
    end
  end
end
