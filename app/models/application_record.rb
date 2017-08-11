
class ApplicationRecord < ActiveRecord::Base
  #require 'bcrypt'


  #has_secure_password
  self.abstract_class = true
end
