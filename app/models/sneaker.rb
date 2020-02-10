class Sneaker < ActiveRecord::Base
  belongs_to :users
  has_and_belongs_to_many :portfolio
end


#class Portfolio < ApplicationRecord
#  has_many :sneakers
#  has_one :user, through: :sneakers
#end
 
#class Sneaker < ApplicationRecord
#  belongs_to :portfolio
#  belongs_to :user
#end
 
#class User < ApplicationRecord
#  has_many :sneakers
#  has_one :portfolio, through: :sneakers
#end