# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    render json: @pokemon
  end

  def create(pokemon_params)
    pokemon_params.permit(:name, :base_exp, :main_type, :main_ability)
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render json: @pokemon
    else
      render json: @pokemon.errors
    end
  end

  def update
    @pokemon = Pokemon.find(params[:id]) # Find the pokemon you want to update
    if @pokemon.update_attributes(pokemon_params) # Validation using the same private method as before
      render json: @pokemon # render the updated record back
    else
      render json: @pokemon.errors, status: :unprocessable_entity # render errors
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    render json: { status: 'Successfully destroyed', data: @pokemon }, status: :ok
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_exp, :main_type, :main_ability)
  end
end
