class ApplicationController < ActionController::Base

    def check_transaction_privelege
        a = Member.where(Email: current_user.email).first
        if a == nil
            sign_out_all_scopes
            respond_to do |format|
                format.html { redirect_to new_user_session_path, notice: 'Unauthorized to perform this action, please contact your administrator to gain priveleges.' }
            end
        elsif a.Role < 5
            sign_out_all_scopes
            respond_to do |format|
                format.html { redirect_to new_user_session_path, notice: 'Unauthorized to perform this action, please contact your administrator to gain priveleges.' }
            end        
        end
    end

    def check_officer_privelege
        a = Member.where(Email: current_user.email).first
        if a == nil
            sign_out_all_scopes
            respond_to do |format|
                format.html { redirect_to new_user_session_path, notice: 'Unauthorized to perform this action, please contact your administrator to gain priveleges. 1' }
            end
        elsif a.Role < 1
            sign_out_all_scopes
            respond_to do |format|
                format.html { redirect_to new_user_session_path, notice: 'Unauthorized to perform this action, please contact your administrator to gain priveleges. 2' }
            end
        end
    end

    def check_admin_privelege
        a = Member.where(Email: current_user.email).first
        if a == nil
            sign_out_all_scopes
            respond_to do |format|
                format.html { redirect_to new_user_session_path, notice: 'Unauthorized to perform this action, please contact your administrator to gain priveleges. 3' }
            end
        elsif a.Role != 4 && a.Role != 6
            sign_out_all_scopes
            respond_to do |format|
                format.html { redirect_to new_user_session_path, notice: 'Unauthorized to perform this action, please contact your administrator to gain priveleges. 4' }
            end
        end
    end

end
