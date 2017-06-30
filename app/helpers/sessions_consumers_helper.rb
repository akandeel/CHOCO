module SessionsConsumersHelper

  # Logging a user in is simple with
  #the help of the session method defined
  #by Rails.

 # We can treat session as if it were a hash,
 #and assign to it as follows:

    # Logs in the given consumer.
  def log_in(consumer)
    session[:consumer.id] = consumer.id
  end

  # Returns the current logged-in user (if any).
  def current_consumer
    @current_consumer ||= User.find_by(id: session[:consumer_id])
  end
end
