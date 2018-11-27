class DirectionsController < ApplicationController

  def index
    @seller = current_seller
    @listings = @seller.listings
  end

end
