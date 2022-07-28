require_relative "furniture_factory"
require_relative "../models/regular_table"
require_relative "../models/regular_chair"

class RegularFurnitureFactory < FurnitureFactory
  def create_chair = RegularChair.new
  def create_table = RegularTable.new
end
