require_relative "furniture_factory"
require_relative "../models/modern_table"
require_relative "../models/modern_chair"

class ModernFurnitureFactory < FurnitureFactory
  def create_chair = ModernChair.new
  def create_table = ModernTable.new
end
