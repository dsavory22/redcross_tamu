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
end
