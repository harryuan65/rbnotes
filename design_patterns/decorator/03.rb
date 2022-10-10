# frozen_string_literal: true

module Decorator
  def initialize(component)
    @component = component
  end

  def method_missing(meth, *args)
    if @component.respond_to?(meth)
      @component.send(meth, *args)
    else
      super
    end
  end

  def respond_to?(meth)
    @component.respond_to?(meth)
  end
end

class Coffee
  def cost
    2
  end

  def origin
    "Colombia"
  end
end

class Milk
  include Decorator

  def cost
    @component.cost + 0.4
  end
end

coffee = Coffee.new
puts "Americano(#{coffee.origin}): #{coffee.cost} "
coffee = Milk.new(coffee)
puts "Latte(#{coffee.origin}): #{coffee.cost} "
puts "Class: #{coffee.class} "

# 缺點：
#
# 1. 會變成 Milk
# 2. method_missing 很慢
