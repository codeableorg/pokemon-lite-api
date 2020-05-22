class PokemonsController < ApplicationController
  before_action :get_pokemon, only: [:show, :update, :destroy]

  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    render json: @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
        render json: @pokemon
    else
        render json: @pokemon.errors
    end
  end

  def update
    if @pokemon.update_attributes(pokemon_params)
        render json: @pokemon
    else
        render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
      @pokemon.destroy
      render json: {status: 'Successfully destroyed', data: @pokemon}, status: :ok
  end

  private
  def get_pokemon
    @pokemon = Pokemon.find_by(id: params[:id])
    return render json: {"error": "the pokemon with id #{params[:id]} doesn't exist"} if @pokemon.nil?
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :main_type, :main_ability)
  end
end
