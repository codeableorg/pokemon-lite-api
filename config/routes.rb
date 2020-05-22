Rails.application.routes.draw do
  resources :pokemons

  resources :trainers do
    resources :pokemons, module: :trainers
  end
end
