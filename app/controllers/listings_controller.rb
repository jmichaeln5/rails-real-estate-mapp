class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_seller, only: [:all_listings, :show, :edit, :update, :destroy]

  def all_listings
    @listings = Listing.all.order("created_at DESC")
  end


  # GET /listings
  # GET /listings.json
  def index
    @seller = Seller.find(params[:seller_id])
    # @buyer = current_buyer
    @listings = @seller.listings
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    # @seller = Seller.find(params[:seller_id])
    @listings = Listing.find(params[:id])
  end

  # GET /listings/new
  def new
    @seller = current_seller
    @listing = @seller.listings.build
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    # @seller = current_seller
    @listing = current_seller.listings.build(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to current_seller, notice: 'Listing was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_seller
      @seller = current_seller
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:description, :latitude, :longitude, :address, :city, :state, :zip, :seller_id)
    end
end
