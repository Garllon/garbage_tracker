# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'piles#index'

  resources :piles, except: [:show]
  resources :containers, except: [:show]
end
