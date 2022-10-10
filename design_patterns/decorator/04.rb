require "delegate"

class Coffee
  def cost = 2

  def origin = "Colombia"
end

class Milk < SimpleDelegator
  def initialize(coffee)
    @coffee = coffee
    super
  end

  # This is not rails but standard wants to format to rails
  # delegate :class, to: :__getobj__
  def class = __getobj__.class

  def cost = @coffee.cost + 0.4
end

coffee = Coffee.new
puts "Americano(#{coffee.origin}): #{coffee.cost} "
coffee = Milk.new(coffee)
puts "Latte(#{coffee.origin}): #{coffee.cost} "
puts "Class: #{coffee.class} "