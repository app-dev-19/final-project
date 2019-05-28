class DashboardsController < ApplicationController
    
    def show_page
        render("/dashboard_templates/index.html.erb")
    end
    
end