
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

    #SORT BY LAST NAME
    if params[:sort] == "Last_Name"
      @members = Member.order(:Last_Name)
      @toggle = 0
    elsif params[:sort] == "Last_Name_Desc"
      @members = Member.order(Last_Name: :desc)
      @toggle = 11

    #SORT BY ROLE
    elsif params[:sort] == "Role"
      @members = Member.order(:Role)
      @toggle = 2
    elsif params[:sort] == "Role_Desc"
      @members = Member.order(Role: :desc)
      @toggle = 33

    #SORT BY EMAIL
    elsif params[:sort] == "Email"
      @members = Member.order(:Email)
      @toggle = 4
    elsif params[:sort] == "Email_Desc"
      @members = Member.order(Email: :desc)
      @toggle = 55

    #SORT BY SHIRT
    elsif params[:sort] == "Shirt"
      @members = Member.order(:Shirt_Size)
      @toggle = 6
    elsif params[:sort] == "Shirt_Desc"
      @members = Member.order(Shirt_Size: :desc)
      @toggle = 77

    #SORT BY YEAR
    elsif params[:sort] == "Year"
      @members = Member.order(:year)
      @toggle = 8
    elsif params[:sort] == "Year_Desc"
      @members = Member.order(year: :desc)
      @toggle = 99
      
    #SORT BY HOURS
    elsif params[:sort] == "Hours"
      hoursList = Attendance.group(:Member_id).sum(:Hours).sort_by{|e| -e[1]}.collect{|imd| imd[0]}
      @members = Member.find(hoursList)+ Member.where.not(id: hoursList)
      @toggle = 10
    elsif params[:sort] == "Hours_Desc"
      hoursList = Attendance.group(:Member_id).sum(:Hours).sort_by{|e| -e[1]}.collect{|imd| imd[0]}
      hoursList = hoursList.reverse()
      @members =  Member.where.not(id: hoursList) + Member.find(hoursList)
      @toggle = 14

    else
      @members = Member.all
    end
    
  end

  def new
    @member = Member.new
  end

  def show
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: "Officer was successfully deleted" }
      format.json { head :no_content }
    end
  end

  private
  
    def set_member
      @member = Member.find(params[:id])
    end
  
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
