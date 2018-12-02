class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]

  def index
    @sellers = Seller.all
    # @restaurants = Restaurant.where(seller_id: @seller).paginate(page: params[:page]).order("created_at DESC")
    #### Pagination found in model.rb file(control amount of @instances per page)
  end

  def show
    @seller = Seller.find(params[:id])
    @listings = Listing.where(seller_id: @seller.id ).order("created_at DESC")

  end

  def new
  end

  def edit
    @seller = Seller.find(params[:id])
  end

  def create
    # seller = Seller.new(seller_params)
    @seller = Seller.new(seller_params)

      if @seller.save
        session[:seller_id] = @seller.id
        redirect_to current_seller

        flash[:register_success] = ["Welcome #{current_seller.email}, thank you for registering."]
      else
        flash[:register_errors] = ["REGISTER ERROR. Invalid credentials, please try again."]
        # redirect_to sellers_index_path
        redirect_to root_path
      end
  end

  def update

      @seller = Seller.find(params[:id])

      if @seller.update(seller_params)
        redirect_to @seller, :notice => "Profile updated successfully."
      else
         redirect_to @seller, :notice => ['Profile could not be updated, please try again later.']
      end
  end

  def destroy
    @seller = Seller.find(params[:id])
    if @seller.destroy
    session[:seller_id] = nil
    redirect_to root_path, :notice => 'You have deleted your profile.'
   else
     redirect_to sellers_edit_path, :notice => ["Seller can not be deleted at this time."]
   end
  end

  private

    def set_seller
      @seller = current_seller
    end

    def seller_params
      params.require(:seller).permit( :email, :password, :password_confirmation)
    end

end
