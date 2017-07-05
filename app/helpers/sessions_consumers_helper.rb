module SessionsConsumersHelper

  # Logging a user in is simple with
  #the help of the session method defined
  #by Rails.

 # We can treat session as if it were a hash,
 #and assign to it as follows:

    # Logs in the given consumer.
  def log_in(consumer)
    session[:consumer.id] = consumer.id #session[:] is provided from rails.
  end

  # Returns the current logged-in user (if any).
  ####check in console with a non existant record
  ####that this raises no exception and returns nil if id is invalid.
  def current_consumer
    #if @current_consumer.nil?
    #   @current_consumer = Consumer.find_by(id: session[:consumer_id])
    #else
    #   @current_consumer
    #end

    #***** THIS LINE DOES THE SAME *****
    @current_consumer ||= Consumer.find_by(id: session[:consumer_id])
  end

  #A user is logged in if there is a current
  #user in the session, i.e.,
  #if current_user is not nil.

  ##### Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_consumer?
  end

  def log_out
    session.delete(:consumer_id)
    @current_consumer = nil
  end
  
end
