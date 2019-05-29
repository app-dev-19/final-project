class UsersController < ApplicationController
    
    def account_details
        # Show past events for the users profile.
        if current_user.meetings.nil?
        elsif current_user.meetings.count == 0
        else
            @events = current_user.meetings.where('start BETWEEN ? AND ?', DateTime.now-1000, DateTime.now).all
        end
        
        render("/users/registrations/account_details_edit.html.erb")
    end
    
    def update_account_details
        user = current_user
        user.first_name = params.fetch("first_name")
        user.last_name = params.fetch("last_name")
        user.save
    
        redirect_to("/users/user_details")
    end
    
end