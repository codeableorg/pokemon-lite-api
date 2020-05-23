# frozen_string_literal: true

class PokemonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id]) if params.has_key?(:trainer_id)
    @pokemons = params.has_key?(:trainer_id) ? @trainer.pokemons : Pokemon.all
    render json: @pokemons
  end

  def show
    @trainer = Trainer.find(params[:trainer_id]) if params.has_key?(:trainer_id)
    @pokemon = params.has_key?(:trainer_id) ? @trainer.pokemons.find(params[:id]) : Pokemon.find(params[:id])  
    render json: @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      if params.has_key?(:trainer_id)
        @trainer = Trainer.find(params[:trainer_id]) 
        @trainer.pokemons << @pokemon
        return render json: @trainer.pokemons
      end
      render json: @pokemon
    else
      render json: @pokemon.errors
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    if params.has_key?(:trainer_id)
      @trainer = Trainer.find(params[:trainer_id]) 
      @trainer.pokemons.destroy(@pokemon)
      return render json: @trainer.pokemons
    end
    @pokemon.destroy
    render json: { status: 'Successfully destroyed', data: @pokemon }, status: :ok
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if params.has_key?(:trainer_id)
      @trainer = Trainer.find(params[:trainer_id]) 
      @trainer.pokemons << @pokemon
      return render json: @trainer.pokemons
    end

    if @pokemon.update_attributes(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :main_type, :main_ability)
  end
end
