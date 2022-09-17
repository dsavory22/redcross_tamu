class Event < ApplicationRecord
    has_many :Shifts
    has_many :Attendance, through: :Shifts
end
