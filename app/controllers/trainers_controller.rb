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
    @trainers = Trainer.new(trainer_params)
    if @trainer_params.save
      render json: @trainers
    else
      render json: @trainers.errors
    end
  end

  def destroy
    @trainers = Trainer.find(params[:id])
    @trainers.destroy
    render json: {status: "Successfully destroyed", data: @trainers}, status: :ok
  end

  def update
    @trainers = Trainer.find(params[:id])
    if @trainers.update_attributes(trainer_params)
      render json: @trainers
    else
      render json: @trainers.errors, status: :unprocessable_entity
    end
  end

  private
  def trainer_params
    params.require(:trainer).permit(:name, :genre, :age, :home_region, :team_member_status, :wins, :losses)
  end
end
