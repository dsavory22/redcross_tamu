class ApplicationController < ActionController::Base
    def check
        a = Member.where(Email: current_user.email).first
        if a == nil
            redirect_to members_path
        elsif Member.where(Email: current_user.email).first.Role < 2
            redirect_to members_path
        
        end
    end
end
