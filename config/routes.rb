# frozen_string_literal: true

Rails.application.routes.draw do
  #get 'trainers', to: 'trainers#index'
  #get 'trainers/:id', to: 'trainers#show'
  resources :trainers
  #get 'pokemons', to: 'pokemons#index'
  #get 'pokemons/:id', to: 'pokemons#show'
  resources :pokemons

  
end
