class Member < ApplicationRecord
    has_many :Attendances
    has_many :Shifts, through: :Attendances

end
