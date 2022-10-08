module Strategy
  class Car
    def calculate_route(source, destination)
      [source.length, destination.length].reduce(&mul)
    end

    private

    def mul = ->(a, b) { a * b }
  end
end
