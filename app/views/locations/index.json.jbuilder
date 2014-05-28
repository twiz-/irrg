json.array!(@locations) do |location|
  json.extract! location, :id, :name, :review_id, :user_id
  json.url location_url(location, format: :json)
end
