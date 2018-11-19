json.extract! listing, :id, :description, :latitude, :longitude, :address, :city, :state, :zip, :created_at, :updated_at
json.url listing_url(listing, format: :json)
