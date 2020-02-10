class Portfolio < ActiveRecord::Base
  has_and_belongs_to_many :sneakers
  has_one :user
end