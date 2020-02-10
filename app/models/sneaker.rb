class Sneaker < ActiveRecord::Base
  belongs_to :portfolio
  has_many :users, through: :portfolio
end