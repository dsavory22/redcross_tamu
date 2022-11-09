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
    validates :Purpose, presence: {message: 'Please enter the purpose'}
    validates :Amount, presence: {message: 'Please enter the amount'}
    validates :Date, presence: true
    validates :Officer, presence: {message: 'Please enter the officer who made the transaction'}
    validates :Amount, :numericality => { :greater_than_or_equal_to => 0, message: 'Please enter an amount greater than 0'}
end
