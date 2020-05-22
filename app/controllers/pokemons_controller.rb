# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    @pokemon = if params[:trainer_id].nil?
                 Pokemon.all
               else
                 Trainer.find(params[:trainer_id]).pokemons
               end
    render json: @pokemon
  end

  def show
    @pokemon = if params[:trainer_id].nil?
                 Pokemon.find(params[:id])
               else
                 Trainer.find(params[:trainer_id]).pokemons.find(params[:id])
               end
    render json: @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if params[:trainer_id].nil?
      if @pokemon.save
        render json: @pokemon
      else
        render json: @pokemon.errors
      end
    else
      @trainer = Trainer.find(params[:trainer_id])
      @trainer.pokemons << @pokemon
      render json: @trainer.pokemons
    end
  end

  def update
    @pokemon = if params[:trainer_id].nil?
                 Pokemon.find(params[:id])
               else
                 Trainer.find(params[:trainer_id]).pokemons.find(params[:id])
               end
    if @pokemon.update_attributes(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon = if params[:trainer_id].nil?
                 Pokemon.find(params[:id])
               else
                 Trainer.find(params[:trainer_id]).pokemons.find(params[:id])
               end
    @pokemon.destroy
    # head :no_content
    render json: { msg: "Pikachu #{params[:id]} had a short circuit" }
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :main_type, :main_ability)
  end
end
