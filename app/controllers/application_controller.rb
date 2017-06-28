class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelpers


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
