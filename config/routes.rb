Rails.application.routes.draw do
  resources :pokemons

  resources :trainers do
    resources :captures, module: :trainers
  end
end
