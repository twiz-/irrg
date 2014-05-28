json.array!(@reviews) do |review|
  json.extract! review, :id, :product_image, :email, :location, :comment, :reviewer_image
  json.url review_url(review, format: :json)
end
