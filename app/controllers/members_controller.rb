class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ] 
  before_action :authenticate_user!
  before_action :check_officer_privelege

  # GET /members or /members.json
  # used same code from show, maybe make helper method to avoid redundancy
  def index
    #@members = Member.all
    if params[:sort] == "Last_Name"
      @members = Member.order(:Last_Name)
    elsif params[:sort] == "Last_Name_Desc"
      @members = Member.order(Last_Name: :desc)
    elsif params[:sort] == "Role"
      @members = Member.order(:Role)
    elsif params[:sort] == "Email"
      @members = Member.order(:Email)
    elsif params[:sort] == "Shirt"
      @members = Member.order(:Shirt_Size)
    elsif params[:sort] == "Year"
      @members = Member.order(:year)
    else  
      @members = Member.all
    end
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
        format.html { redirect_to members_url, notice: "Member was successfully created" }
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
