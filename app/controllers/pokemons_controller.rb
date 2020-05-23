# frozen_string_literal: true

class PokemonsController < ApplicationController

  before_action :load_trainer

  def index
    @pokemons = @trainer.present? ? @trainer.pokemons : Pokemon.all
    @pokemons.all
    render json: @pokemons
  end

  def show
    @pokemons = @trainer.present? ? @trainer.pokemons : Pokemon.all
    @pokemon = @pokemons.find(params[:id])
    render json: @pokemon
  end
 
  def create
    if @trainer.present?
      @pokemon = @trainer.pokemons.new(pokemon_params)
      @pokemon.trainers << @trainer
    else
      @pokemon = Pokemon.new(pokemon_params)
    end

    if @pokemon.save
      render json: @pokemon
    else
      render json: @pokemon.errors
    end
  end

  def update
    if @trainer.present?
       @pokemon = @trainer.pokemons.find(params[:id])  
    else
      @pokemon = Pokemon.find(params[:id])
    end

    if @pokemon.update_attributes(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @trainer.present?
      @pokemon = @trainer.pokemons.find(params[:id])
      @trainer.pokemons.delete(@pokemon)
      render json: { status: 'Successfully destroyed', data: @pokemon }, status: :ok
    else
      @pokemon = Pokemon.find(params[:id])
      @pokemon.destroy
      render json: { status: 'Successfully destroyed', data: @pokemon }, status: :ok
    end
  end


  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :experience, :main_type, :main_ability)
  end

  def load_trainer
    @trainer = Trainer.find(params[:trainer_id]) if params.key?(:trainer_id)
  end
end
