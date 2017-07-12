class Consumer < ApplicationRecord

  attr_accessor :remember_token # to create an accessible attribute to store cookies without saving to database

#***** FOR FIXTURES *****
  before_save { self.email_address = email_address.downcase }

 #ASSOCIATIONS
  has_many :sales

 #VALIDATIONS
  validates_presence_of :first_name,
                        :last_name,
                        :gender,
                        :date_of_birth,
                        :country,
                        :street_number,
                        :street_name,
                        :state,
                        :suit,
                        :mailing_address,
                        :email_address

  validates_uniqueness_of :first_name,
                          :last_name,
                          :email_address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 } #bcrypt does this implicitly but we just need to put a password length.

has_secure_password
#don't need to validate :password,
#presence because has_secure_password
#already does it.

# Returns the hash digest of the given string.
# a method to create a password_digest attribute for our custom fixture consumer.
# *** the password digest is created using bcrypt (via has_secure_password)
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #Because we’ll need to log the user in, we also
  #have to include a valid password to compare
  #with the password submitted to the Sessions
  #controller’s create action. Referring to the
  #model we see that this
  #means creating a password_digest attribute
  #for the user fixture, which we’ll accomplish
  #by defining a digest method of our own.


  # Returns a random token.
 def self.new_token
   SecureRandom.urlsafe_base64
 end

 # PERFECT FOR REMEMBER TOKENS
 #specifically designed to be safe in URLs
# ***** The urlsafe_base64 method from the SecureRandom module
#in the Ruby standard library returns a random string of length 22
# each of the 22 characters has 64 possibilities.



 #we can create a valid token and associated digest
 #by first making a new remember token using Consumer.new_token,
 #and then updating the remember digest with the result of
 #applying Consumer.digest. This procedure gives
 #the remember method



 # MAKE REMEMBER TOKEN METHOD.
 # this is a class method.
 # Remembers a user in the database for use in persistent sessions.
   def remember
     self.remember_token = Consumer.new_token #Using self ensures that assignment sets the user’s remember_token attribute and doesn't create a local variable.
     update_attribute(:remember_digest, Consumer.digest(remember_token))
   end
   # update_attribute bypasses the validations, which is necessary in this case because we don’t have access to the user’s password or confirmation.)


   #USING BCRYPT CODE
   # Returns true if the given token matches the digest.
   def authenticated?(remember_token)
    if remember_digest.nil? # using nil and returning false fixes error in test.
     false
    else
     BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
     # return false if remember_digest.nil? is required to set th digest
     # to nil because BCrypt::Password.new(nil) raises an error, the test
     #suite should be red. that line fixes it.

   end

 #Note that the remember_token argument in the
 #authenticated? method is not the same
 #as the accessor in the class.attr_accessor :remember_token;
 #instead, it is a variable local to the method.

 #Because the argument refers to the remember token,
 # it is not uncommon to use a method argument that
 # has the same name.

 #Also note the use of the
 #remember_digest attribute, which is the
 #same as self.remember_digest and,
 #like name and email, is created automatically
 #by Active Record based on the name of the
 #corresponding database column (Listing 9.1).

 #WHAT THE $#%&%$*^%$*



 #forget a consumers permanent session by adding a forget helper and calling it from the log_out helper
   def forget
    #update_attribute (:remember_digest, nil) #this doesn't pass for some reason.
   #end
    if remember_digest.nil?
      false
    else
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  end

end
