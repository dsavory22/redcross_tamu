json.extract!(attendance, :id, :Hours, :Start, :End, :created_at, :updated_at)
json.url(attendance_url(attendance, format: :json))
