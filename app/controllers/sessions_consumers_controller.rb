class SessionsConsumersController < ApplicationController

  def new
  end

  def create
    #consumer = Consumer.find_by_email(params[:email])
      if consumer && consumer.authenticate(params[:password])
        session[:consumer_id] = consumer.id
        redirect_to root_path, notice: "logged in"
      else
        flash.now[:alert] "Email or password is invalid"
        render new
      end
  end

  def destroy
    session[:consumer_id] = nil
    #clear out session with the next line if you choose.
    #reset_session
    redirect_to root_path, notice: "logged out"
  end

end
