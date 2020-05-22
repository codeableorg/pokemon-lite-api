class TrainersController < ApplicationController
  before_action :get_trainer, only: [:show, :update, :destroy]

  def index
    @trainers = Trainer.all 
    render json: @trainers
  end 

  def show
    render json: @trainer
  end 

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      render json: @trainer
    else
      render json: @trainer.errors
    end
  end

  def destroy
    @trainer.destroy
    render json: {status: "Successfully destroyed", data: @trainer}, status: :ok if @trainer
  end
  
  def update
    if @trainer.update_attributes(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end
  
  private
  def get_trainer
    @trainer = Trainer.find_by(id: params[:id])
    return render json: {"error": "the trainer with id #{params[:id]} doesn't exist"} if @trainer.nil?
  end

  def trainer_params
    params.require(:trainer).permit(:name, :gender, :home_region, :team_member_status, :wins, :losses)
  end
end
