class Member < ApplicationRecord
  has_many :Attendances
  has_many :Shifts, through: :Attendances

  # Validations for member form input fields
  #   needs first name
  #   needs last name
  #   does NOT need email
  #   does NOT need shirt size
  #   does NOT need year
  validates :First_Name, presence: true
  validates :Last_Name, presence: true
end
