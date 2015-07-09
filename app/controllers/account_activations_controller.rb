class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated! Welcome to the Programm3r's Domain!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link."
      redirect_to root_url
    end
  end
end
