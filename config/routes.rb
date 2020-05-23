# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :pokemons do
    resources :trainers
  end

  resources :trainers do
    resources :pokemons
  end
end
