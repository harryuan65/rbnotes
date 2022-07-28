require_relative "modern_furniture_factory"
require_relative "regular_furniture_factory"
require_relative "vintage_furniture_factory"

#
# Responsible for instanciate factory
#
class FactoryBase
  # @type [Hash{String=>VintageFurnitureFactory, ModernFurnitureFactory, RegularFurnitureFactory}] chosen factory
  CATEGORIES = {
    "vintage" => VintageFurnitureFactory,
    "modern" => ModernFurnitureFactory
  }
  def self.call(category)
    (CATEGORIES[category] || RegularFurnitureFactory).new
  end
end
