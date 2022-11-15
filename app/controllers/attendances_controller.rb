class AttendancesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_attendance, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :check_officer_privelege, only: [:show, :edit, :update, :destroy]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    # path = (request.fullpath)[17..-1] 
    # uri = CGI::parse(path)
    # @eventid = ((uri["eventid"])[0])
    @attendance = Attendance.new
    @shift_options = Shift.where(Event_id: @eventid)
    @event_name = params[:event_id]
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    respond_to do |format|
      if @attendance.save
        if current_user.nil?
          format.html { redirect_to :controller => "users/sessions", :action => "new", notice: "Sign up successful" }
        else
          format.html { redirect_to event_url(params[:attendance][:event_id]), notice: "Attendance was successfully created" }
        end
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to event_url(params[:attendance][:event_id]), notice: "Attendance was successfully updated" }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Attendance was successfully deleted" }
      format.json { head :no_content }
    end
  end

  def sign_in
    @att = Attendance.find(params[:at])
    @att.changeHours
    @att.save
    redirect_to attendances_path, notice: "Sign in successful"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:Member_id,:Shift_id,:Hours, :Start, :End)
    end
end