class Attendance < ApplicationRecord
    belongs_to :Member
    belongs_to :Shift

#Validations for application form input fields
=begin
	needs member
	needs a shift
	does NOT needs hours
	needs start
	does NOT need end
=end
    validates :Member_id, presence: true
    validates :Shift_id, presence: true

    require 'uri'
    require 'cgi'

    def changeHours
        shift = Shift.where(id: self.Shift_id).first
        self.Hours = ((shift.End - shift.Start)/3600).round
        self.save
    end

end
