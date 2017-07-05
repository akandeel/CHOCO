class Consumer < ApplicationRecord

  has_many :sales

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
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

has_secure_password

#don't need to validate :password,
#presence because has_secure_password
#already does it.

# Returns the hash digest of the given string.
# a method to create a password_digest attribute for our custom fixture consumer.
# *** the password digest is created using bcrypt (via has_secure_password)
  def Consumer.digest(string)
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

  

end
