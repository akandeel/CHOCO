class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  #he Rails CSRF protection is made for "classical" web apps -
  #it simply gives a degree of assurance that the request
  #originated from your own web app. A CSRF token works l
  #ike a secret that only your server knows -
  #Rails generates a random token and stores
  #it in the session. Your forms send the token
  #via a hidden input and Rails verifies that any non
  #GET request includes a token that matches what
  #is stored in the session.

#However an API is usually by definition cross site
#and meant to be used in more than your web app,
#which means that the whole concept of CSRF does not quite apply.

#Instead you should use a token based strategy of
#authenticating API requests with an API key and
#
#secret since you are verifying that the request 
#comes from an approved API client - not from your own app.

  include SessionsHelper # MAKE HELPERS MODULE AVAILABLE TO OTHER CONTROLLERS



private
  #once consumer is logged in he/she should be
  #able to see that indicated in the view to see their log in status.
  #to do that we need:
  def current_consumer
    @current_consumer ||= Consumer.find(session[:consumer_id]) if session[:consumer_id]
  end

  #access current_consumer in view, not just in model.
  helper_method :current_consumer

  def authorize
    redirect_to login_url, alert: "Please log in before getting delicious chocolate!" if current_consumer.nil?
  end
end
