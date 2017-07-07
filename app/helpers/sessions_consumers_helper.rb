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
# ***********************************************



  #Storing a user’s (encrypted) id and remember token as permanent cookies on the browser.
  # It uses cookies to create permanent cookies for the user id and remember token
  def remember(consumer)
    consumer.remember #remember is called from class. Remember consumer in a persistent session.
    cookies.permanent.signed[:consumer_id] = consumer.id
    cookies.permanent[:remember_token] = consumer.remember_token
  end
  #permanent = rails save for 20 years method.
  #signed = rails encrypting method.
  # *********************************************


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
  #  @current_consumer ||= Consumer.find_by(id: session[:consumer_id])
  #end
  #A user is logged in if there is a current user in the session, i.e.,
  #if current_user is not nil.
  #so we do not get error in rails server.

  #### CURRENT_USER MUST BE ADJUSTED FOR PERSISTENT SESSIONS
  #WHEN LOGGED INTO MORE THAN ONE BROWSER:

    if (consumer_id = session[:user_id]) #assigns consumer_id to session.
      @current_consumer ||= Consumer.find_by(id: consumer_id)
    elsif (consumer_id = cookies.signed[:consumer_id])
      consumer = Consumer.find_by(id: consumer_id)
        if consumer && consumer.authenticated?(cookies[:remember_token])
          log_in consumer
          @current_consumer = consumer
        end
    end
  # Returns the consumer corresponding to the remember token cookie.

# ***********************************************



 # Returns true if the consumer is logged in, false otherwise.
  def logged_in?
    !current_consumer?
  end



   # Logs out the current user.
  def log_out
    forget(current_consumer) #called from consumer.rb. it sets remember_token attribute to nil.
    session.delete(:consumer_id) #deletes session.
    @current_consumer = nil # new value of this instance variable.
  end

  #Forgets a persistant session.
  def forget(consumer)
    consumer.forget
    cookies.delete(;consumer_id)
    cookies.delete(:remember_token)
  end



end
