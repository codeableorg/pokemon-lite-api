class TrainersController < ApplicationController
  class PokemonsController < ApplicationController
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
      params.require(:trainer).permit(:name, :gender, :home_region, :status, :wins, :losses)
    end
  end

end
