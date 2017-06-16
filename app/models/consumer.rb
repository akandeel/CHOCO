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


end
