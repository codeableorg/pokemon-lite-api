class Trainers::PokemonsController < ApplicationController
  before_action :get_trainer
  before_action :get_pokemon, only: [:show, :update, :destroy]

  def index
    render json: @trainer.pokemons
  end

  def create
    @pokemon = Pokemon.find_by(name: pokemon_params()["name"])
    return render json: {"error": "the pokemon with name #{pokemon_params()["name"]} doesn't exist"} if @pokemon.nil?

    @trainer_pokemon = @trainer.pokemons.build(pokemon: @pokemon, experience: pokemon_params()["experience"])
    if @trainer_pokemon.save  
      render json: @trainer_pokemon
    else
      render json: @trainer_pokemon.errors
    end
  end

  def show
    render json: @trainer_pokemon
  end

  def update
    if @trainer_pokemon.update_attributes(pokemon_params())
      render json: @trainer_pokemon
    else
      render json: @trainer_pokemon.errors
    end
  end

  def destroy
    @trainer_pokemon.destroy
    render json: {status: 'Successfully destroyed', data: @trainer_pokemon}, status: :ok
  end

  private
  def get_trainer
    @trainer = Trainer.find_by(id: params[:trainer_id])
    return render json: {"error": "this trainer with id #{params[:trainer_id]}  doesn't exist"} if @trainer.nil?
  end

  private
  def get_pokemon
    @trainer_pokemon = TrainerPokemon.find_by(trainer_id: params[:trainer_id], pokemon_id: params[:id])
    return render json: {"error" => "The trainner with id #{params[:trainer_id]} doesn't have a pokemon with id #{params[:id]}"} if @trainer_pokemon.nil?
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :experience)
  end
end