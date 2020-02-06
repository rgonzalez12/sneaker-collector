class Sneaker < ActiveRecord::Base
  has_and_belongs_to_many :user_id
end