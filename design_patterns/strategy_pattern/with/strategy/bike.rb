# frozen_string_literal: true

module Strategy
  ERROR_CORRECTION = 5

  class Bike
    def calculate_route(source, destination)
      [source.length, destination.length].reduce(&squared) + ERROR_CORRECTION
    end

    private

    def squared = ->(a, b) { a * b**2 }
  end
end
