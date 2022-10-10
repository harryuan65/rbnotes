class Pizza
  def cost
    2.0
  end

  def flavor
    "Orignal Taste"
  end
end

module Onions
  def cost = super + 1
  def flavor = super + " + Onions"
end

module Cheese
  def cost = super + 2.2
  def flavor = super + " + Cheese"
end

pizza = Pizza.new
pizza.extend(Onions)
pizza.extend(Cheese)

puts <<~YML
  Pizza:
    cost: #{pizza.cost}
    flavor: #{pizza.flavor}
YML
