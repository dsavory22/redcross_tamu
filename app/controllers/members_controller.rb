class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ] 
  before_action :authenticate_user!
  before_action :check_officer_privelege


  # GET /members or /members.json
  # used same code from show, maybe make helper method to avoid redundancy
  def index

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

  #Attendance.select(:Hours, :Member_id).group(:Member_id).sum(:Hours)
  @MemberAttendances = Attendance.where(Member_id: params[:id]) 
    @hours = 0
    @MemberAttendances.each do |single|
      @hours = @hours + ((single.Shift.End - single.Shift.Start)/3600).round
    end
  end

  # GET /members/1 or /members/1.json
  def show
  #todo: make sure to change params to proper sql query
    # member attendances gets all attended shifts for a member
    @MemberAttendances = Attendance.where(Member_id: params[:id]) 
    @hours = 0
    @MemberAttendances.each do |single|
      @hours = @hours + ((single.Shift.End - single.Shift.Start)/3600).round
    end
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
    respond_to do |format|
      if @member.save
        format.html { redirect_to new_member_path, notice: "Member was successfully created" }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_url, notice: "Member was successfully updated" }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully deleted" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:First_Name, :Last_Name, :Role, :Email, :Fall_Dues, :Spring_Dues, :Shirt_Size, :year)
    end
end
