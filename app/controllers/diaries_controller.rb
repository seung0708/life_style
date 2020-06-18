class DiariesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_diary, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:user_id] && @user = User.find_by_id(:user_id)
            @diaries = @user.diaries  
        else
            @error = "This diary doesn't exist" if params[:user_id]
            @diaries = Diary.all 
        end 
    end

    def new
        @diary = Diary.new
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
    end 

    def edit
    end 

    def update
        if diary.update(params[:diary]) 
        else 
            render :edit
        end 
    end 

    def destroy
        @diary.destroy
        redirect_to diaries_path
    end 

    private 
        def diary_params
            params.require(:diary).permit(
                :date, 
                diary_entries_attributes: [:serving_size],
                food_ids:[],
                foods_attributes: [:name, :calories, :protein, :carbohydrates, :fats]
                )
        end 

        def find_diary
            @diary = Diary.find_by(id: params[:id])
            redirect_if_not_owner
        end 

end
