class TrainerPokemonsController < ApplicationController
  before_action :set_trainer_pokemon, only: [:show, :update, :destroy]

  # GET /trainers/:trainer_id/pokemons List all the pokemon of one trainer
  def index
    @trainer_pokemons = TrainerPokemon.where(trainer_id: params['trainer_id'])
    render json: @trainer_pokemons
  end

  # GET /trainers/:trainer_id/pokemon/:id Show one pokemon of one trainer
  def show
    render json: @trainer_pokemon
  end

  # POST /trainers/:trainer_id/pokemons Create a pokemon for one trainer
  def create
    @trainer_pokemon = TrainerPokemon.new(trainer_pokemon_params)

    if @trainer_pokemon.save
      render json: @trainer_pokemon, status: :created
    else
      render json: @trainer_pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainers/:trainer_id/pokemons/:id Update a pokemon for one trainer
  def update
    if @trainer_pokemon.update(trainer_pokemon_params)
      render json: @trainer_pokemon
    else
      render json: @trainer_pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainers/:trainer_id/pokemons/:id Destroy a pokemon for one trainer
  def destroy
    @trainer_pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer_pokemon
      @trainer_pokemon = TrainerPokemon.find_by(trainer_id: params[:trainer_id], pokemon_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trainer_pokemon_params
      params.require(:trainer_pokemon).permit(:trainer_id, :pokemon_id)
    end
end
