class DirectionsController < ApplicationController

  def index
    @seller = current_seller
    @listings = Listing.order('state ASC')
  end

end
