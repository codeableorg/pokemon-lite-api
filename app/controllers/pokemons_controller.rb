class PokemonsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update_attributes(trainer_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :main_ability, :main_type)
  end
end
