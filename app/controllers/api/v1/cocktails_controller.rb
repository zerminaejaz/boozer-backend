module Api
  module V1
    class CocktailsController < ApplicationController
      def index
        render json: Cocktail.all
      end

      def show
        cocktail = Cocktail.find(params[:id])

        cocktail_json = {
          id: cocktail.id,
          name: cocktail.name,
          description: cocktail.description,
          instructions: cocktail.instructions,
          source: cocktail.source,
          proportions: cocktail.proportions.map do |prop|
            {
              id: prop.id,
              ingredient_name: prop.ingredient.name,
              amount: prop.amount
            }
          end
        }
        render json: cocktail_json
      end

      def create
        # byebug
        cocktail_params
        # @cocktail = Cocktail.create(cocktail_params)
        @cocktail = Cocktail.create!(name: params[:cocktail][:name], description: params[:cocktail][:name], instructions: params[:cocktail][:instructions], source: params[:cocktail][:source])
        params[:proportions].map do |prop| 
          @ingredient = Ingredient.create!(name: prop[:ingredient_name])
          @proportion = Proportion.create!(amount: prop[:amount], cocktail_id: @cocktail.id, ingredient_id: @ingredient.id)
        end
        
        cocktail_json = {
          id: @cocktail.id,
          name: @cocktail.name,
          description: @cocktail.description,
          instructions: @cocktail.instructions,
          source: @cocktail.source,
          proportions: @cocktail.proportions.map do |prop|
            {
              id: prop.id,
              ingredient_name: prop.ingredient.name,
              amount: prop.amount
            }
          end
        }
        render json: cocktail_json
      end

      def edit

      end

      def update

      end

      def destroy
        cocktail = Cocktail.find(params[:id])
        cocktail.destroy
       
      end

      def cocktail_params
        params.require(:cocktail).permit(:name, :description, :instructions, :source, proportions: [:ingredient_name, :amount]) 
      end
    end
  end
end
