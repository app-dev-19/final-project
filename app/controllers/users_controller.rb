class UsersController < ApplicationController
    
    def account_details
        # Show past events for the users profile.
        if current_user.meetings.nil?
        elsif current_user.meetings.count == 0
        else
            start_date = Date.today-1000
            end_date = Date.today-1
            @events = current_user.meetings.where(:end_date => start_date..end_date)
            render("/users/registrations/account_details_edit.html.erb")
        end
    end
    
    def update_account_details
        user = current_user
        user.first_name = params.fetch("first_name")
        user.last_name = params.fetch("last_name")
        user.gmail = params.fetch("gmail")
        user.save
    
        redirect_to("/users/user_details")
    end
    
end