class Sneaker < ActiveRecord::Base
  has_and_belongs_to_many :portfolios
  
  validates :manufacturer, presence: true
end