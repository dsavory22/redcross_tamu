class Attendance < ApplicationRecord
    belongs_to :Member
    belongs_to :Shift
end
