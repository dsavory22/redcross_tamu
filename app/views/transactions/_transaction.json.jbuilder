json.extract! transaction, :id, :Amount, :Date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
