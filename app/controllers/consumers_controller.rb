class ConsumersController < ApplicationController


#***** FOR FIXTURES *****
  before_save { self.email = email.downcase }
 validates :name,  presence: true, length: { maximum: 50 }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: { maximum: 255 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }
 has_secure_password
 validates :password, presence: true, length: { minimum: 6 }

 # Returns the hash digest of the given string.
 def Consumer.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                 BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
 end

 # Returns a random token.
 def Consumer.new_token
   SecureRandom.urlsafe_base64
 end

 # Remembers a consumer in the database for use in persistent sessions.
 def remember
   self.remember_token = Consumer.new_token
   update_attribute(:remember_digest, Consumer.digest(remember_token))
 end

 # Returns true if the given token matches the digest.
 def authenticated?(remember_token)
   BCrypt::Password.new(remember_digest).is_password?(remember_token)
 end

  def new
    @consumer = Consumer.new
  end

  def create
    @consumer = Consumer.new(consumer_params)
    if @consumer.save

      redirect_to root_path, notice: ""
    else
      render '/consumers/new'
    end
  end

  def edit
    @consumer = Consumer.find(params[:id])
  end

  def update
    @consumer = Consumer.find(params[:id])
    if @consumer.update_attributes(consumer_params)
        redirect_to(:action=> 'show', :id=> @consumer.id)
      else
        render 'edit'
    end
  end

  def show
    @consumer = Consumer.find(params:[id])
    # @sales = @consumer.sales YOU NEED AFTER SALES MODEL IS MADE.
  end

  def destroy
  end

private

def consumer_params
  params.require(:consumer).permit(

                                :first_name,
                                :last_name,
                                :gender,
                                :date_of_birth,
                                :country,
                                :street_number,
                                :street_name,
                                :state,
                                :suit,
                                :mailing_address
                                )











  end
end
