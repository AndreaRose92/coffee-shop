class Customer < ActiveRecord::Base
  has_many :orders
  has_many :coffee, through: :orders

  def self.names
    self.pluck :name
  end

  def order_coffee coffee_title, price
    new_order = Order.create price: price, customer_id: self.id, coffee_id: Coffee.find_by(title: coffee_title).id
    binding.pry
    new_order.receipt
  end

  def total_purchases_amount
    self.orders.pluck(:price).sum
  end

  def dislike_coffee coffee_title
    bad_coffee = self.orders.where(coffee_id: Coffee.find_by(title: coffee_title).id).last
    puts "#{self.name} has been refunded #{bad_coffee.price}"
    bad_coffee.destroy
  end

end