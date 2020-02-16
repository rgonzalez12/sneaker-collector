class User < ActiveRecord::Base
  
  PASSWORD_REQ = /\A 
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[A-Z])
  (?=.*[[:^alnum:]])
  /x
  
  has_many :sneakers
  has_secure_password
  validates :password, format: PASSWORD_REQ
  validates :email_address, uniqueness: true
  
end