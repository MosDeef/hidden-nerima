if @review.persisted?
  json.form render(partial: "shared/new_reviews", formats: :html, locals: {spot: @spot, review: Review.new})
  json.inserted_item render(partial: "spots/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "shared/new_reviews", formats: :html, locals: {spot: @spot, review: @review})
end
