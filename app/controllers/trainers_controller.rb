# frozen_string_literal: true

class TrainersController < ApplicationController
  def index
    @trainer = if params[:pokemon_id].nil?
                 Trainer.all
               else
                 Pokemon.find(params[:pokemon_id]).trainers
               end
    render json: @trainer
  end

  def show
    @trainer = if params[:pokemon_id].nil?
                 Trainer.find(params[:id])
               else
                 Pokemon.find(params[:pokemon_id]).trainers.find(params[:id])
               end
    render json: @trainer
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if params[:pokemon_id].nil?
      if @trainer.save
        render json: @trainer
      else
        render json: @trainer.errors
      end
    else
      @pokemon = Pokemon.find(params[:pokemon_id])
      @pokemon.trainers << @trainer
      render json: @pokemon.trainers
    end
  end

  def update
    @trainer = if params[:pokemon_id].nil?
                 Trainer.find(params[:id])
               else
                 Pokemon.find(params[:pokemon_id]).trainers.find(params[:id])
               end

    if @trainer.update_attributes(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trainer = if params[:pokemon_id].nil?
                 Trainer.find(params[:id])
               else
                 Pokemon.find(params[:pokemon_id]).trainers.find(params[:id])
               end
    @pokemon.destroy
    render json: { msg: "Hash Ketchup #{params[:id]} banned" }
  end

  private

  def trainer_params
    params.require(:trainer).permit(:name, :gender, :home_region, :status, :wins, :losses)
  end
end
