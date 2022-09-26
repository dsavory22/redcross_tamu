class Shift < ApplicationRecord
    has_many :Attendances
    has_many :Members, through: :Attendances
    belongs_to :Event

#validations for shift form
=begin
New Shifts
	make sure the dates match between start and end
	start > event.start
	end < event.end
	start < end

	shift capacity
		for meetings make it nil
		for vounteer events must be >= 0
=end

    validates :Event_id, presence: true       

	validates_time :End, on_or_after: :Start, before_message: "End time must be on or after the start time"

	validates :Shift_Cap, :numericality => { :greater_than_or_equal_to => 0 }
end
