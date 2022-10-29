class ApplicationController < ActionController::Base
    def check
        if User.where(email: current_user.email).first.authority_level == 0
            redirect_to members_path
        end
    end
end
