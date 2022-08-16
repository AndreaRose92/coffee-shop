class Customer < ActiveRecord::Base
  has_many :orders
  has_many :coffee, through: :orders
end