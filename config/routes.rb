Rails.application.routes.draw do
  resources :pokemons
  resources :trainers
  resources :trainers do
    resources :pokemons
  end
end
