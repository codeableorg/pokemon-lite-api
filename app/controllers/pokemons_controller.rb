class PokemonsController < ApplicationController
    def index
        @pokemons = Pokemon.all
        render json: @pokemons
    end
    def show
        @pokemon = Pokemon.find(params[:id])
        render json: @pokemon
    end
    def create
        @pokemon = Pokemon.new(pokemon_params)
        if @pokemon.save
            render json: @pokemon
        else
            render json: @game.errors
        end
    end

    def update
        @pokemon = Pokemon.find(params[:id])
        if @pokemon.update_attributes(pokemon_params)
            render json: @pokemon
        else
            render json: @game.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @pokemon = Pokemon.find(params[:id])
        @pokemon.destroy
        render json: {status: 'Successfully destroyed', data: @pokemon}, status: :ok
    end

    private
    def pokemon_params
        params.require(:pokemon).permit(:name, :base_experience, :main_type, :main_ability)
    end
end
