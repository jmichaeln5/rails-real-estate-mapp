class DirectionsController < ApplicationController

  def index
    @seller = current_seller
    @listings = Listing.all
  end

end
