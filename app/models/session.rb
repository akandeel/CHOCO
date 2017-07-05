class Session < ApplicationRecord

  def new
  end

  def create
    consumer = Consumer.find_by(email: params[:session][:email].downcase)
     if consumer && consumer.authenticate(params[:session][:password])
       log_in consumer
       remember consumer #this is the remember helper
       redirect_to consumer

       #defers the real work to the Sessions
       #helper, where we define a remember
       #method that calls user.remember, thereby
       #generating a remember token and saving its
       # digest to the database. It then uses cookies
       #to create permanent cookies for the user id
       #and remember token as described above.
       #The result appears in
       #app/helpers/sessions_consumers_helper.rb

     else
       flash.now[:danger] = 'Invalid email or password'
       render 'new'
     end
   end

   def destroy
     log_out
     redirect_to root_url
   end
end
