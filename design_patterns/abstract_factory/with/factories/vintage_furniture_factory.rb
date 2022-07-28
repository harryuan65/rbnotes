require_relative "furniture_factory"
require_relative "../models/vintage_table"
require_relative "../models/vintage_chair"

class VintageFurnitureFactory < FurnitureFactory
  def create_chair = VintageChair.new
  def create_table = VintageTable.new
end
