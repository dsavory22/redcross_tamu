json.extract! event, :id, :Type, :Date, :Name, :Start, :End, :created_at, :updated_at
json.url event_url(event, format: :json)
