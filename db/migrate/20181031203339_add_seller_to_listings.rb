class AddSellerToListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :seller, foreign_key: true
  end
end
