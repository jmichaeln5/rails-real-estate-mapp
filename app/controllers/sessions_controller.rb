class SessionsController < ApplicationController


    def new

    end

    def create_buyer
      buyer = Buyer.find_by_email(params[:email])

      if buyer && buyer.authenticate(params[:password])
        session[:buyer_id] = buyer.id
        redirect_to current_buyer
        puts "**************************"
        puts "****  BUYER LOGGED IN ***"
        puts "**************************"
      else
        flash[:login_errors] = ['Invalid credentials, please try again.']
        redirect_to root_path
      end
    end


    def create_seller
      seller = Seller.find_by_email(params[:email])
      if seller && seller.authenticate(params[:password])
        session[:seller_id] = seller.id
        redirect_to current_seller, :notice => "Logged in successfully."
        puts "**************************"
        puts "****  SELLER LOGGED IN ***"
        puts "**************************"
      else
        flash[:login_errors] = ['Invalid credentials, please try again.']
      end
    end



    def destroy
      session[:seller_id] = nil || session[:buyer_id] = nil
      cookies.delete(:auth_token)
      redirect_to root_url, :notice => "Logged out successfully."
      puts "**************************"
      puts "****    LOGGED OUT *******"
      puts "**************************"
    end

    private

    def login_params
      params.require(:seller).permit(:email, :password) || params.require(:buyer).permit(:email, :password)
    end


#### Maybe keep both?

    # def login_params
    #    params.require(:buyer).permit(:email, :password)
    # end
    #
    # def login_params
    #    params.require(:seller).permit(:email, :password)
    # end

#### Doesn't Work :(
#####################


end
