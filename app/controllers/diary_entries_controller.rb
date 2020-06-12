class DiaryEntriesController < ApplicationController
    def index
        @diary_entries = DiaryEntry.all
    end

    def new
        @diary_entry = DiaryEntry.new
        #@diary_entry.foods.build()
    end 

    def create
        @diary_entry = current_user.diary_entries.build(diary_entry_params)
        if @diary_entry.save
            redirect_to diary_entries_path
        else 
            render :new
        end 
    end 

    def show
        @diary_entry = DiaryEntry.find_by(id: params[:id])
    end 

    def edit
        @diary_entry = DiaryEntry.find_by(id: params[:id])
    end 

    def update
        @diary_entry = DiaryEntry.find_by(id: params[:id])
        if diary_entry.update(params[:diary_entries]) 
            redirect_to diary_entries_path
        else 
            render :edit
        end 
    end 

    def diary_entry_params
        params.require(:diary_entry).permit()
    end 

end 

