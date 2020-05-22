class TrainersController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # GET /trainers
  def index
    @trainers = Trainer.all
    render json: @trainers, status: :ok
  end

  # GET /trainers/{id}
  def show
    @trainer = Trainer.find(params[:id])
    render json: @trainer, status: :ok
  end

  # POST /trainers
  def create
    @trainer = Trainer.create!(create_params)
    render json: @trainer, status: :created
  end

  # PUT /trainers/{id}
  def update
    @trainer = Trainer.find(params[:id])
    @trainer.update!(update_params)
    render json: @trainer, status: :ok
  end

  #DELETE /trainers/{id}
  def destroy
    @trainer = Trainer.find(params[:id])
    @trainer.delete
    render json: @trainer, status: :ok
  end

  private

  def create_params
    params.permit(:name, :gender, :region, :team_member, :wins, :losses)
  end

  def update_params
    params.permit(:name, :gender, :region, :team_member, :wins, :losses)
  end
end