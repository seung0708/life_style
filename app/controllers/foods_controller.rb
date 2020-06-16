class FoodsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def show 
        @food = Food.find_by(id: params[:id])
    end 

    def index
        @foods = Food.alpha
    end 

    def new
        @food = Food.new
    end 

    def create
        @food = Food.new(food_params)
          if  @food.save
            redirect_to foods_path  
          else
            render :new
          end 
    end 

    def edit
        @food = Food.find_by(id: params[:id])
    end

    def update
        @food = Food.find_by(id: params[:id])
        @food.update(food_params)
        redirect_to food_path(@food)
    end 

    private

    def food_params
        params.require(:food).permit(:name, :protein, :carbohydrates, :fats, :calories)
    end 
end