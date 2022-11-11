
class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :check_officer_privelege
  before_action :generate_qr_attendance
  before_action :generate_qr_shifts
  
  # GET /events or /events.json
  def index
    @events = Event.all
  end

  def names
    @names = Member.all
  end

  # GET /events/1 or /events/1.json
  def show
    @EventShifts = Shift.where(Event_id: params[:id])
    @EventAttendances = Attendance.joins(:Shift).where(Shift: {Event_id: params[:id]})
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.url = request.base_url + '/events/' # + params[:id] + '?att=1' 
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:Type, :Date, :Name, :Start, :End)
    end

    def generate_qr_attendance
      qrcode_attendance = RQRCode::QRCode.new(request.base_url + "/attendance/new?signup=1" )
      png = qrcode_attendance.as_png(
          bit_depth: 1,
          border_modules: 4,
          color_mode: ChunkyPNG::COLOR_GRAYSCALE,
          color: "black",
          file: nil,
          fill: "white",
          module_px_size: 6,
          resize_exactly_to: false,
          resize_gte_to: false,
          size: 120
      )
      @png = png.to_s
    end

    def generate_qr_shifts
      qrcode_shift = RQRCode::QRCode.new(request.base_url + "/attendances" )
      png = qrcode_shift.as_png(
          bit_depth: 1,
          border_modules: 4,
          color_mode: ChunkyPNG::COLOR_GRAYSCALE,
          color: "black",
          file: nil,
          fill: "white",
          module_px_size: 6,
          resize_exactly_to: false,
          resize_gte_to: false,
          size: 120
      )
      @png2 = png.to_s  
    end
end
