# frozen_string_literal: true

class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
    render json: @trainers
  end

  def show
    @trainer = Trainer.find(params[:id])
    render json: @trainer
  end

  def create(trainer_params)
    trainer_params.permit(:name, :base_exp, :main_type, :main_ability)
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      render json: @trainer
    else
      render json: @trainer.errors
    end
  end

  def update
    @trainer = Trainer.find(params[:id]) # Find the trainer you want to update
    if @trainer.update_attributes(trainer_params) # Validation using the same private method as before
      render json: @trainer # render the updated record back
    else
      render json: @trainer.errors, status: :unprocessable_entity # render errors
    end
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.destroy
    render json: { status: 'Successfully destroyed', data: @trainer }, status: :ok
  end

  private

  def trainer_params
    params.require(:trainer).permit(:t_name, :t_gender, :t_region, :t_team_member, :wins, :losses)
  end
end
