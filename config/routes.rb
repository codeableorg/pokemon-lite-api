Rails.application.routes.draw do
  #resources :trainer_pokemons
  resources :pokemons
  resources :trainers
  resources :trainers do
    resources :pokemons, :controller => "trainer_pokemons"
  end
end
