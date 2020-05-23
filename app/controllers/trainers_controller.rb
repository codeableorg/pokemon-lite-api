# frozen_string_literal: true

class TrainersController < ApplicationController
  def index
    @pokemon = Pokemon.find(params[:pokemon_id]) if params.has_key?(:pokemon_id)
    @trainers = params.has_key?(:pokemon_id) ? @pokemon.trainers : Trainer.all 
    render json: @trainers
  end

  def show
    @pokemon = Pokemon.find(params[:pokemon_id]) if params.has_key?(:pokemon_id)
    @trainer = params.has_key?(:pokemon_id) ? @pokemon.trainers.find(params[:id]) : Trainer.find(params[:id])
    render json: @trainer
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      if params.has_key?(:pokemon_id)
        @pokemon = Pokemon.find(params[:pokemon_id]) 
        @pokemon.trainers << @trainer
        return render json: @pokemon.trainers
      end
      render json: @trainer
    else
      render json: @trainer.errors
    end
  end

  def destroy
    @trainer = Trainer.find(params[:id])
    if params.has_key?(:pokemon_id)
      @pokemon = Pokemon.find(params[:pokemon_id]) 
      @pokemon.trainers.destroy(@trainer)
      return render json: @pokemon.trainers
    end
    @trainer.destroy
    render json: { status: 'Successfully destroyed', data: @trainer }, status: :ok
  end

  def update
    @trainer = Trainer.find(params[:id])
    if params.has_key?(:pokemon_id)
      @pokemon = Pokemon.find(params[:pokemon_id]) 
      @pokemon.trainers << @trainer
      return render json: @pokemon.trainers
    end
    if @trainer.update_attributes(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  private
  def trainer_params
    prm = params.require(:trainer).permit(:name, :gender, :home_region, :team_member_status, :wins, :losses)
    prm[:team_member_status] = [true, false, 'true', 'false'].include?(prm[:team_member_status]) ? prm[:team_member_status] : nil
    prm
  end
end
