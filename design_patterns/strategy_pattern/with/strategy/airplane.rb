# frozen_string_literal: true

module Strategy
  class Airplane
    def calculate_route(source, destination)
      [source.length / 2, destination.length / 2].reduce(&combine)
    end

    private

    def weather_error_correction = (rand * 10).to_i

    def combine = ->(a, b) { a + b + weather_error_correction }
  end
end
