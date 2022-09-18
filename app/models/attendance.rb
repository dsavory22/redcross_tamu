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
    validates :Start, presence: true
end
