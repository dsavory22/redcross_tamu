
class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_officer_privelege
  before_action :check_admin_privelege

  def index
    if params[:param] == 'Reset Dues'
      reset_dues
    end
    if params[:param] == 'Reset Hours'
      reset_hours
    end
    if params[:param] == 'Increase Grade'
      increase_grade
    end
    
  end

  def show
  end

  private
  
    def reset_dues
      Member.all.each do |member|
        member.Fall_Dues = false
        member.Spring_Dues = false
        member.save
      end
    end

    def reset_hours
      a = Budget.first
      a.Date = Date.current
      a.save
    end

    def increase_grade
      Member.all.each do |member|
        if member.year <= 5
          member.year = member.year + 1
          member.save
        end
      end
    end
end
