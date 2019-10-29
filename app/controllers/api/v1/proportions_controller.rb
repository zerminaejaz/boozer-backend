module Api
    module V1
      class ProportionsController < ApplicationController
        def index
          render json: Proportion.all
        end
  
        def show
          prop = Proportion.find(params[:id])
  
          proportion_json = {
                id: prop.id,
                ingredient_name: prop.ingredient.name,
                amount: prop.amount
          }

          render json: proportion_json
        end
  
        def create
          @proportion = Proportion.create(proportion_params)
        
        end
  
        def edit
  
        end
  
        def update
  
        end
  
        def destroy
  
        end
  
        def proportion_params
          params.require(:proportion).permit(:amount, :cocktail_id, :ingredient_id) 
        end
      end
    end
  end
  