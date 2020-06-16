class DiaryEntriesController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def new
        @diary_entry = DiaryEntry.new
    end 

    def create
        @diary_entry = DiaryEntry.new(diary_entry_params)
        @diary_entry
            if !@diary_entry.errors.any?
                redirect_to 
            else 
            render :new
        end 
    end     

    private 
    
    def diary_entry_params
        params.require(:diary_entry).permit(:serving_size)
    end 
end 