class Transaction < ApplicationRecord
  belongs_to :Budget

  # validations for transaction form
  # New Transaction
  #   needs to select budget
  #   needs amount
  #   date defaults to todays date
  # validates :Budget_id, presence: true
  validates :Amount, presence: true
  # validates :Date, presence: true
  # validates :Officer, presence: true
end
