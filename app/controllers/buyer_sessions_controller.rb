class BuyerSessionsController < ApplicationController

    def new
    end

    def create
      buyer = Buyer.find_by_email(params[:email])
      # If the buyer exists AND the password entered is correct.
      if buyer && buyer.authenticate(params[:password])
        # Save the buyer id inside the browser cookie. This is how we keep the buyer
        # logged in when they navigate around our website.
        session[:buyer_id] = buyer.id
        redirect_to current_buyer
      else
        flash[:login_errors] = ['Invalid credentials, please try again.']
        # redirect_to buyers_index_path
        redirect_to root_path
      end
    end

    def destroy
      session[:buyer_id] = nil
      cookies.delete(:auth_token)
      redirect_to root_url, :notice => "Logged out successfully."
    end

    private

    def login_params
      params.require(:buyer).permit(:email, :password)
    end

end
