class Pokemons::CapturesController < ApplicationController
  before_action :get_pokemon
  before_action :get_capture, only: [:show, :update, :destroy]

  def index
    render json: @pokemon.captures
  end

  def create
    @trainer = Trainer.find_by(name: create_params()["trainer_name"])
    return render json: {"error": "the trainer with name #{create_params()["trainer_name"]} doesn't exist"} if @trainer.nil?

    @capture = @pokemon.captures.build(trainer: @trainer, experience: create_params()["experience"])
    if @capture.save  
      render json: @capture
    else
      render json: @capture.errors
    end
  end

  def show
    render json: @capture
  end

  def update
    if @capture.update_attributes(update_params())
      render json: @capture
    else
      render json: @capture.errors
    end
  end

  def destroy
    @capture.destroy
    render json: {status: 'Successfully destroyed', data: @capture}, status: :ok
  end

  private
  def get_pokemon
    @pokemon = Pokemon.find_by(id: params[:pokemon_id])
    return render json: {"error": "the pokemon with id #{params[:pokemon_id]} doesn't exist"} if @pokemon.nil?
  end

  def get_capture
    @capture = Capture.find_by(pokemon_id: params[:pokemon_id], id: params[:id])
    return render json: {"error" => "The pokemon with id #{params[:pokemon_id]} doesn't have a capture with id #{params[:id]}"} if @capture.nil?
  end

  def create_params
    params.require(:capture).permit(:trainer_name, :experience)
  end

  def update_params
    params.require(:capture).permit(:experience)
  end
end