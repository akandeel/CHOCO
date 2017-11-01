class AccountActivationsController < ApplicationController


  def edit
    user = User.find_by(email_address: params[:email_address])
    if user && !user.activated? && user.authenticated?(:activation, params([:id]) )
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Congrats! Your account is active!"
      redirect_to users_path
    else
      flash[:danger] = "Incorrect activation link"
      redirect_to root_url
    end
  end

end
