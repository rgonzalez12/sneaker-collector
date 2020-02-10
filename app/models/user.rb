class User < ActiveRecord::Base
  
  PASSWORD_REQ = /\A 
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[A-Z])
  (?=.*[[:^alnum:]])
  /x
  
  has_one :portfolio
  has_many :sneakers, through :portfolio
  has_secure_password
  validates :password, format: PASSWORD_REQ
end