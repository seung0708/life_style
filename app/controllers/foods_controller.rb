class FoodsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_food, only: [:show, :edit, :update]

    def index
        @foods = Food.alpha
    end 

    def new
        if params[:diary_id] && @diary = Diary.find_by_id(params[:diary_id])
            @food = @diary.foods.build
        else
            @error = "This diary doesn't exist" if params[:diary_id]
            @food = Food.new
        end 
    end 

    def create
        @food = Food.new(food_params)
          if  @food.save
            redirect_to foods_path  
          else
            render :new
          end 
    end 

    def show 
    end 

    def edit
        
    end 

    def update
        @food.update(food_params)
        redirect_to food_path(@food)
    end 

    private

    def food_params
        params.require(:food).permit(:name, :protein, :carbohydrates, :fats, :calories, food_ids:[])
    end 

    def find_food
        @food = Food.find_by(id: params[:id])

    end 

end
