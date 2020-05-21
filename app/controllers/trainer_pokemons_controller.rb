class TrainerPokemonsController < ApplicationController
  before_action :set_trainer_pokemon, only: [:show, :update, :destroy]

  # GET /trainer_pokemons
  def index
    @trainer_pokemons = TrainerPokemon.all

    render json: @trainer_pokemons
  end

  # GET /trainer_pokemons/1
  def show
    render json: @trainer_pokemon
  end

  # POST /trainer_pokemons
  def create
    @trainer_pokemon = TrainerPokemon.new(trainer_pokemon_params)

    if @trainer_pokemon.save
      render json: @trainer_pokemon, status: :created, location: @trainer_pokemon
    else
      render json: @trainer_pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainer_pokemons/1
  def update
    if @trainer_pokemon.update(trainer_pokemon_params)
      render json: @trainer_pokemon
    else
      render json: @trainer_pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainer_pokemons/1
  def destroy
    @trainer_pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer_pokemon
      @trainer_pokemon = TrainerPokemon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trainer_pokemon_params
      params.require(:trainer_pokemon).permit(:trainer_id, :pokemon_id)
    end
end
