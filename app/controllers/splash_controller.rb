class SplashController < ApplicationController
    
    skip_before_action(:authenticate_user!, { :only => :show_page })
    
    def show_page
        render("/splash.html.erb")
    end
    
end