class Event < ApplicationRecord
    has_many :Shifts
    has_many :Attendance, through: :Shifts

#Validations for member form input fields
=begin
New Event
	type default 0
	date defaults to todays date
	name must be filled in
	start time must be input (restrict to valid times)
	does NOT need end time
=end
    validates :Type, presence: true
    validates :Name, presence: true
    validates :Start, presence: true

    validates_time :End, on_or_after: :Start, before_message: "End time must be on or after the start time"

    has_one_attached :qr_code_attendance
    has_one_attached :qr_code_shift

    
    after_create :generate_qr_shifts
    after_create :generate_qr_attendance

    
    #Ex:- :default =>''

    include Rails.application.routes.url_helpers

    require "rqrcode"

    def generate_qr_shifts
        qr_url_shift = url_for(controller: 'events',
        action: 'show',
        id: self.id,
        only_path: false,
        host: '127.0.0.1',
        source: 'from_qr_shifts')

        qrcode_shift = RQRCode::QRCode.new(qr_url_shift)

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
        image_name_shift = SecureRandom.hex
        IO.binwrite("tmp/#{image_name_shift}.png", png.to_s) 
        @filepath = "tmp/#{image_name_shift}.png"
        
        blob_shift = ActiveStorage::Blob.create_after_upload!(
            io: File.open("tmp/#{image_name_shift}.png"),
            filename: image_name_shift,
            content_type: 'png'
          )

        self.qr_code_shift.attach(blob_shift)
   
    end

    def generate_qr_attendance
        qr_url_attendance = url_for(controller: 'events',
        action: 'show',
        id: self.id,
        only_path: false,
        host: '127.0.0.1',
        source: 'from_qr_attendance')

        qrcode_attendance = RQRCode::QRCode.new(qr_url_attendance)

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
        image_name = SecureRandom.hex
        IO.binwrite("tmp/#{image_name}.png", png.to_s)
        
        blob = ActiveStorage::Blob.create_after_upload!(
            io: File.open("tmp/#{image_name}.png"),
            filename: image_name,
            content_type: 'png'
          )

        self.qr_code_attendance.attach(blob)
   
    end
    

    def to_s
        title
    end
end
