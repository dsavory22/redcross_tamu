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
end
