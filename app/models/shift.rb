class Shift < ApplicationRecord
    has_many :Attendances
    has_many :Members, through: :Attendances
    belongs_to :Event, through: :Event
end
