class SplashController < ApplicationController
    
    def show_page
        render("/splash.html.erb")
    end
    
end