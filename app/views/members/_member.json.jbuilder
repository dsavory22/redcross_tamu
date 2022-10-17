json.extract!(member, :id, :First_Name, :Last_Name, :Email, :Fall_Dues, :Spring_Dues, :Shirt_Size, :year, :created_at, :updated_at)
json.url(member_url(member, format: :json))
