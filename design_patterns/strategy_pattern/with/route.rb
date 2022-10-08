require_relative "strategy/airplane"
require_relative "strategy/bike"
require_relative "strategy/boat"
require_relative "strategy/car"

class Route
  attr_writer :vehicle # changable strategy

  def initialize(current_location, vehicle)
    @current_location = current_location
    @vehicle = vehicle # default strategy
    @destination = nil
  end

  def directions(destination)
    @destination = destination
    hours
  end

  private

  def hours
    @vehicle.calculate_route(@current_location, @destination)
  end
end

# Client code
route = Route.new("Home", Strategy::Airplane.new)
puts "Airplane: #{route.directions("San Francisco")} hours"

route.vehicle = Strategy::Car.new
puts "Car: #{route.directions("San Francisco")} hours"

route.vehicle = Strategy::Bike.new
puts "Bike: #{route.directions("San Francisco")} hours"

route.vehicle = Strategy::Boat.new
puts "Boat: #{route.directions("San Francisco")} hours"
