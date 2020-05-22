class Trainers::PokemonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    render json: @trainer.pokemons
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.create(pokemon_params)
    render json: @pokemon
  end

  def show
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.find(params[:id])
    render json: @pokemon
  end

  def update
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.find(params[:id])
    if @pokemon.update_attributes(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors.message, status: :unproccessable_entity
    end
  end

  def destroy
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.find(params[:id])
    @pokemon.destroy
    render json: { status: 'Successfully destroyed', data: @pokemon }, status: :ok
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :main_ability, :main_type, :base_exp)
  end
end
