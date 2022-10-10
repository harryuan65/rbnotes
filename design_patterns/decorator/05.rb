require "delegate"

class Coffee
  def cost = 2

  def origin = "Colombia"
end

class Milk < SimpleDelegator
  def cost = __getobj__.cost + 0.4
end

coffee = Coffee.new
puts "Americano(#{coffee.origin}): #{coffee.cost} "
coffee = Milk.new(coffee)
puts "Latte(#{coffee.origin}): #{coffee.cost} "
puts "Class: #{coffee.class} "
