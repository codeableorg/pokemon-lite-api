class Trainers::CapturesController < ApplicationController
  before_action :get_trainer
  before_action :get_capture, only: [:show, :update, :destroy]

  def index
    render json: @trainer.captures
  end

  def create
    @pokemon = Pokemon.find_by(name: capture_params()["name"])
    return render json: {"error": "the pokemon with name #{capture_params()["name"]} doesn't exist"} if @pokemon.nil?

    @capture = @trainer.captures.build(pokemon: @pokemon, experience: capture_params()["experience"])
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
    if @capture.update_attributes(capture_params())
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
  def get_trainer
    @trainer = Trainer.find_by(id: params[:trainer_id])
    return render json: {"error": "the trainer with id #{params[:trainer_id]} doesn't exist"} if @trainer.nil?
  end

  private
  def get_capture
    @capture = Capture.find_by(trainer_id: params[:trainer_id], id: params[:id])
    return render json: {"error" => "The trainner with id #{params[:trainer_id]} doesn't have a capture with id #{params[:id]}"} if @capture.nil?
  end

  def capture_params
    params.require(:capture).permit(:name, :experience)
  end
end