class Budget < ApplicationRecord
  has_many :transactions

  # validations for budget form
  #     New Budget
  #         must include amount
  #         must be within int Limits
  validates :Total_amount, presence: true
end
