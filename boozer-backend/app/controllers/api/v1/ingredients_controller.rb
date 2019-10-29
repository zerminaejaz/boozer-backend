module Api
    module V1
      class IngredientsController < ApplicationController
        def index
          render json: Ingredient.all
        end
  
        def show
          ingredient = Ingredient.find(params[:id])
  
          ingredient_json = {
            id: ingredient.id,
            name: ingredient.name,
          }
  
          render json: ingredient_json
        end
  
        def create
          byebug
          @ingredient = Ingredient.create(ingredient_params)
         
        end
  
        def edit
  
        end
  
        def update
  
        end
  
        def destroy
  
        end
  
        def ingredient_params
          params.require(:ingredient).permit(:name) 
        end
      end
    end
  end
  