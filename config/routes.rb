Rails.application.routes.draw do
  resources :pokemons do
    resources :captures, module: :pokemons
  end

  resources :trainers do
    resources :captures, module: :trainers
  end
end
