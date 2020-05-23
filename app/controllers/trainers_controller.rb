class TrainersController < ApplicationController
  # rescue_from ActiveRecord::RecordInvalid do |e|
  #   render json: {error: e.message}, status: :unprocessable_entity
  # end
  before_action :load_pokemon
  # GET /trainers
  def index
    @trainers = @pokemon.present? ? @pokemon.trainers : Trainer.all
    @trainers.all
    render json: @trainers
  end

  # GET /trainers/{id}
  def show
    @trainers = @pokemon.present? ? @pokemon.trainers : Trainer.all
    @trainer = @trainers.find(params[:id])
    render json: @trainer
  end

  # POST /trainers
  def create
    if @pokemon.present?
      @trainer = @pokemon.trainers.new(trainer_params)
      @trainer.pokemons << @pokemon
    else
      @trainer = Trainer.new(trainer_params)
    end
  
    if @trainer.save
      render json: @trainer
    else
      render json: @trainer.errors
    end
  end

  # PUT /trainers/{id}
  def update
    if @pokemon.present?
      @trainer = @pokemon.trainers.find(params[:id])
    else
      @trainer = Trainer.find(params[:id])
    end

    if @trainer.update!(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  #DELETE /trainers/{id}
  def destroy
    if @pokemon.present?
      @trainer = @pokemon.trainers.find(params[:id])
      @pokemon.trainers.delete(@trainer)
      render json: { status: 'Successfully destroyed', data: @trainer }, status: :ok
    else
      @trainer = Trainer.find(params[:id])
      @trainer.destroy 
      render json: { status: 'Successfully destroyed', data: @trainer }, status: :ok
    end 
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :gender, :region, :team_member, :wins, :losses)
  end

  def load_pokemon
  @pokemon = Pokemon.find(params[:pokemon_id]) if params.key?(:pokemon_id)
  end
end