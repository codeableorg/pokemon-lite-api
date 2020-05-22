class Trainers::PokemonsController < ApplicationController
  before_action :get_trainer

  def index
    render json: ["holi"]
  end

  def create
    @pokemon = @trainer.pokemons.build(pokemon_params())
    if @pokemon.save  
      render json: @pokemon
    else
      render json: @pokemon.errors
    end
  end

  private
  def get_trainer
    @trainer = Trainer.find(params[:trainer_id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :main_type, :main_ability)
  end
end