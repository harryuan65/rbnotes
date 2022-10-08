class Route
  def initialize(current_location)
    @current_location = current_location
    @destination = nil
  end

  def directions(vehicle, destination)
    @destination = destination
    calculate_route(@current_location, @destination, vehicle)
  end

  private

  def calculate_route(source, dest, vehicle)
    case vehicle
    when :airplane
      weather_error_correction = (rand * 3).to_i
      source.length / 2 + dest.length / 2 + weather_error_correction
    when :bike
      source.length * dest.length**2 + 5 # ERROR_CORRECTION
    when :boat
      source.length * dest.length**3
    when :car
      source.length * dest.length
    end
  end
end

# Client code
route = Route.new("Taipei")
puts "Airplane: #{route.directions(:airplane, "San Francisco")} hours"
puts "Car: #{route.directions(:car, "San Francisco")} hours"
puts "Bike: #{route.directions(:bike, "San Francisco")} hours"
puts "Boat: #{route.directions(:boat, "San Francisco")} hours"
