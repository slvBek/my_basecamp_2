class HomeController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[homepage]
    
    def homepage
        if current_user
            redirect_to projects_path
        end
    end

    def dashboard
        # if current_user
        #     redirect_to projects_path
        # end
    end
end