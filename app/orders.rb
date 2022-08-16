class Order < ActiveRecord::Base
  belongs_to :customers
  belongs_to :coffee
end