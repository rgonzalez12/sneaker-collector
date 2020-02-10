class Portfolio < ActiveRecord::Base
  has_many :sneakers
  has_one :user, through: :sneakers
end