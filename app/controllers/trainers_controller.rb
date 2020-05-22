class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all 
    render json: @trainers
  end 

  def show
    @trainers = Trainer.find(params[:id])
    render json: @trainers
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
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    render json: {status: "Successfully destroyed", data: @trainer}, status: :ok
  end

  def update
    @trainer = Trainer.find(params[:id])
    if @trainer.update_attributes(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  private
  def trainer_params
    params.require(:trainer).permit(:name, :gender, :home_region, :team_member_status, :wins, :losses)
  end
end
