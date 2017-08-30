class SessionsController < ApplicationController


  def new
  end




 # you make have to change def create because I dont know if i can have one session.rb or if I need 2.
  def create
      user = User.find_by(email_address: params[:session][:email_address].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        log_in user #helper method used here to log in user upon signup before redirect.
        params[:session][:remember_me] == '1' ? remember(user) : forget(user) #using ternary operator to reduce conditional to determine 1 or 0.
        remember user #helper method used to call user.remember generating a rmemeber token and saving its digest to database.
        redirect_to user notice: "logged in"
      else
        flash.now[:alert] = "Email or password is invalid"
        render '/users/new'
      end
  end

  def destroy
    #session[:user_id] = nil
    #clear out session with the next line if you choose.
    #reset_session
    log_out if logged_in? #created in sessions_helper.rb
    redirect_to root_path, notice: "logged out"
  end

end
