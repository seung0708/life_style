class DiariesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :redirect_if_not_owner
    def index
            
            @diary = Diary.all
            
    end

    def new
            @diary = current_user.new
            @diary.foods.build
            @diary.diary_entries.build
    end 

    def create
        @diary = current_user.diaries.build(diary_params)
        if @diary.save
            redirect_to diary_path(@diary)
        else
            render :new
        end 
    end

    def show
        @diary = Diary.find_by(id: params[:id])
    end 

    def edit
        @diary = Diary.find_by(id: params[:id])
    end 

    def update
        @diary = Diary.find_by(id: params[:id])
        if diary.update(params[:diary]) 
            redirect_to diary_path
        else 
            render :edit
        end 
    end 

    def diary_params
        params.require(:diary).permit(
            :date, 
            diary_entries_attributes: [:serving_size],
            food_ids:[],
            foods_attributes: [:name, :calories, :protein, :carbohydrates, :fats]
            )
    end 


end
