class SessionsController < ApplicationController


  def new
  end


 # you make have to change def create because I dont know if i can have one session.rb or if I need 2.
  def create
      @consumer = Consumer.find_by(email_address: params[:session][:email_address].downcase)
      if @consumer && @consumer.authenticate(params[:session][:password])
        session[:consumer_id] = consumer.id
        log_in @consumer #helper method used here to log in user upon signup before redirect.
        params[:session][:remember_me] == '1' ? remember(@consumer) : forget(@consumer) #using ternary operator to reduce conditional to determine 1 or 0.
        remember consumer #helper method used to call consumer.remember generating a rmemeber token and saving its digest to database.
        redirect_to consumer, notice: "logged in"
      else
        flash.now[:alert] = "Email or password is invalid"
        render new
      end
  end

  def destroy
    #session[:consumer_id] = nil
    #clear out session with the next line if you choose.
    #reset_session
    log_out if logged_in? #created in sessions_helper.rb
    redirect_to root_path, notice: "logged out"
  end

end
