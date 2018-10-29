class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  def index
    @buyers = Buyer.all
  end

  def show
    @buyer = current_buyer
  end

  def new
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def create

    @buyer = Buyer.new(buyer_params)

      if @buyer.save
        session[:buyer_id] = @buyer.id
        redirect_to current_buyer

        flash[:register_success] = ["Welcome #{current_buyer.email}, thank you for registering."]
      else
        flash[:register_errors] = ["REGISTER ERROR. Invalid credentials, please try again."]
        # redirect_to buyers_index_path
        redirect_to root_path
      end
  end

  def update

      @buyer = Buyer.find(params[:id])

      if @buyer.update(buyer_params)
        redirect_to @buyer, :notice => "Profile updated successfully."
      else
         redirect_to @buyer, :notice => ['Profile could not be updated, please try again later.']
      end
  end

  def destroy
    @buyer = Buyer.find(params[:id])
    if @buyer.destroy
    session[:buyer_id] = nil
    redirect_to root_path, :notice => 'You have deleted your profile.'
   else
     redirect_to buyers_edit_path, :notice => ["Buyer can not be deleted at this time."]
   end
  end

  private

    def set_buyer
      @buyer = current_buyer
    end

    def buyer_params
      params.require(:buyer).permit( :email, :password, :password_confirmation)
    end

end
