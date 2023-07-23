json.extract! reservation, :id, :space_id, :date_start, :description, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
