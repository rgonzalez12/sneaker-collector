class Sneaker < ActiveRecord::Base
  #belongs_to :portfolio
  has_and_belongs_to_many :portfolios
  validates :manufacturer, presence: true
end