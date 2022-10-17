class Attendance < ApplicationRecord
  belongs_to :Member
  belongs_to :Shift

  # Validations for application form input fields
  #   needs member
  #   needs a shift
  #   does NOT needs hours
  #   needs start
  #   does NOT need end
  validates :Member_id, presence: true
  validates :Shift_id, presence: true
  validates :Start, presence: true

  validates_time :End, on_or_after: :Start, before_message: 'End time must be on or after the start time'
end
