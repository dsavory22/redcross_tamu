class Member < ApplicationRecord
	has_many :Attendances
	has_many :Shifts, through: :Attendances


	

  validates :First_Name, presence: {message: 'Please enter their first name'}
  validates :Last_Name, presence: {message: 'Please enter their last name'}
  validates :Role, presence: true

	
end



#@MemberAttendances = Attendance.where(Member_id: 21) 
#			@MemberAttendances.each do |att|
#				csv << [att.Shift.Event.Name, att.Shift.Event.Date, att.Shift.Start, att.Shift.End]
#			end