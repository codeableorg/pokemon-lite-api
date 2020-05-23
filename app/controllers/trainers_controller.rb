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

  def create
    @trainer = Trainer.new(p(trainer_params))
    p @trainer
    p 'test create'

    @trainer.team_member_status = %w[true false].include?(@trainer.team_member_status) ? @trainer.team_member_status : nil
    p 'test create'

    if @trainer.save
      render json: @trainer
    else
      render json: @trainer.errors
    end
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :gender, :home_region, :team_member_status, :wins, :losses)
    # puts 'in trainer params'
    # puts params
    # puts params.class
    params[:trainer][:team_member_status] = %w[true false].include?(params[:trainer][:team_member_status]) ? params[:trainer][:team_member_status] : nil
    params[:trainer]
  end
end
