class Transaction < ApplicationRecord
    belongs_to :Budget

#validations for transaction form
=begin
New Transaction
	needs to select budget
	needs amount
	date defaults to todays date
=end
    # validates :Budget_id, presence: true
    validates :Amount, presence: true, numericality: {only_integer: true}
    # validates :Date, presence: true
    # validates :Officer, presence: true
end
