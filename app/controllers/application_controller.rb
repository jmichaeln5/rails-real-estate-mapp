class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_buyer # makes the current_buyer availible for the view.
  helper_method :current_seller # makes the current_seller availible for the view.

  def current_buyer
    @current_buyer ||= Buyer.find(session[:buyer_id]) if session[:buyer_id] #if it is equal to nil then they need to login ----- if true continue on that session
  end

  def current_seller
    @current_seller ||= Seller.find(session[:seller_id]) if session[:seller_id] #if it is equal to nil then they need to login ----- if true continue on that session
  end

end
