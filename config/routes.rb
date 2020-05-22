Rails.application.routes.draw do
  resources :pokemons
  resources :trainers

  # Nested resources
  resources :trainers do
    resources :pokemons
  end

  resources :pokemons do
    resources :trainers
  end

end
