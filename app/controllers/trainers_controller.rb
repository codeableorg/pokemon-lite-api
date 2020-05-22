class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
    render json: @trainers
  end

  def show
    @trainer = Trainer.find(params[:id])
    render json: @trainer
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      render json: @trainer
    else
      render json: @trainer.errors.messages
    end
  end

  def update
    @trainer = Trainer.find(params[:id])
    if @trainer.update_attributes(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors.message, status: :unproccessable_entity
    end
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    render json: {status: 'Successfully destroyed', data:@trainer}, status: :ok
  end

  private
  def trainer_params
    params.require(:trainer).permit(:name, :gender, :region, :team_member, :wins, :losses)
  end
end
