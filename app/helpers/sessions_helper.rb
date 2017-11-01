module SessionsHelper

  # Logging a user in is simple with
  #the help of the session method defined
  #by Rails.

 # We can treat session as if it were a hash,
 #and assign to it as follows:

    # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id #session[:] is provided from rails.
  end
# ***********************************************



  #Storing a user’s (encrypted) id and remember token as permanent cookies on the browser.
  # It uses cookies to create permanent cookies for the user id and remember token
  #remember helper to go along with log_in
  def remember(user)
    user.remember #remember is called from class. Remember user in a persistent session.
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  #permanent = rails save for 20 years method.
  #signed = rails encrypting method.
  # *********************************************


  # Returns the current logged-in user (if any).
  ####check in console with a non existant record
  ####that this raises no exception and returns nil if id is invalid.
  def current_user
    #if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])
    #else
    #   @current_user
    #end

    #***** THIS LINE DOES THE SAME *****
  #  @current_user ||= User.find_by(id: session[:user_id])
  #end
  #A user is logged in if there is a current user in the session, i.e.,
  #if current_user is not nil.
  #so we do not get error in rails server.

  #### CURRENT_USER MUST BE ADJUSTED FOR PERSISTENT SESSIONS
  #WHEN LOGGED INTO MORE THAN ONE BROWSER:

 #if we close Chrome, we set session[:user_id] to nil
 #(because all session variables expire automatically
 #on browser close), but the user_id cookie will still
 #be present. This means that the corresponding user
 # will still be pulled out of the database when
  #Chrome is re-launched.

  # **** hence why we need the elsif conditional tht ofcuses on the cookies.

    if (user_id = session[:user_id]) #assigns user_id to session.
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      #raise # raise an exception in the suspected untested block of code: if the code isn’t covered, the tests will still pass; if it is covered, the resulting error will identify the relevant test
      user = User.find_by(id: user_id)
        if user && user.authenticated?(:remember, cookies[:remember_token])
          log_in user
          @current_user = user
        end
    end
  end
    # because user isn’t nil, the second expression will
    #be evaluated, which raises an error. This is because
    #the user’s remember digest was deleted as part of logging out
    #in Firefox, so when we access the application in
    #Chrome we end up calling:
    #BCrypt::Password.new(remember_digest).is_password?(remember_token)

    # *****with a nil remember digest, thereby raising an exception inside the bcrypt library. To fix this, we want authenticated? to return false instead.
    # Returns the user corresponding to the remember token cookie.

# ***********************************************



 # Returns true if the user is logged in, false otherwise.
 # refactored.
  def logged_in?
    !current_user?
  end



   # Logs out the current user.
  def log_out
    forget(current_user) #called from user.rb. it sets remember_token attribute to nil.
    session.delete(:user_id) #deletes session.
    @current_user = nil # new value of this instance variable.
  end

  #Forgets a persistant session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end
