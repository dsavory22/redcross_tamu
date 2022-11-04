class ApplicationController < ActionController::Base

    def check_transaction_privelege
        a = Member.where(Email: current_user.email).first
        if a == nil
            redirect_to members_path
        elsif a.Role < 5
            redirect_to members_path
        
        end
    end

    def check_officer_privelege
        a = Member.where(Email: current_user.email).first
        if a == nil
            redirect_to members_path #To be "unauthorized - Contact administrator"
        elsif a.Role < 1
            redirect_to members_path
        
        end
    end

    def check_admin_privelege
        a = Member.where(Email: current_user.email).first
        if a == nil
            redirect_to members_path
        elsif a.Role != 4 && a.Role != 6
            redirect_to members_path
        end
    end

end
