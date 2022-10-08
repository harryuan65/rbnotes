module Strategy
  class Boat
    def calculate_route(source, destination)
      [source.length, destination.length].reduce(&cube)
    end

    private

    def cube = ->(a, b) { a * b**3 }
  end
end
