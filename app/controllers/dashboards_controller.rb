class DashboardsController < ApplicationController
    
    def show_page
        render("/dashboard_templates/index.html.erb")
    end
    
    
    def refresh_from_gmail
        redirect_to("/dashboard")
    end
    
end