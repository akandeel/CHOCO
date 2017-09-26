class Business < ApplicationRecord

  belongs_to :users

  #has_many :sales

  validates_presence_of :business_name,
                        :directors_name,
                        :country,
                        :street_number,
                        :street_name,
                        :province,
                        :unit_number,
                        :mailing_address,
                        :email_address


  validates_uniqueness_of :business_name,
                          :country,
                          :street_number,
                          :street_name,
                          :province,
                          :unit_number,
                          :mailing_address,
                          :email_address



end
