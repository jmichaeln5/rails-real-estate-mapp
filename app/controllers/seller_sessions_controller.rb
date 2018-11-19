class SellerSessionsController < ApplicationController

    def new
    end

    def create
      seller = Seller.find_by_email(params[:email])
      # If the seller exists AND the password entered is correct.
      if seller && seller.authenticate(params[:password])
        # Save the seller id inside the browser cookie. This is how we keep the seller
        # logged in when they navigate around our website.
        session[:seller_id] = seller.id
        redirect_to current_seller, :notice => "Logged in successfully."
      else
        flash[:login_errors] = ['Invalid credentials, please try again.']
        # redirect_to sellers_index_path
        redirect_to root_path
      end
    end

    def destroy
      session[:seller_id] = nil
      cookies.delete(:auth_token)
      redirect_to root_url, :notice => "Logged out successfully."
    end

    private

    def login_params
      params.require(:seller).permit(:email, :password)
    end

end
