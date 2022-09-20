class Budget < ApplicationRecord
    has_many :transactions


#validations for budget form
=begin
    New Budget
        must include amount
        must be within int Limits
=end
    validates :Total_amount, presence: true
end
