# frozen_string_literal: true

class PaypalLib
  class << self
    def subscription(email:)
      puts "Creating subscription for email: #{email}"
    end

    def customer(first_name:, last_name:)
      puts "Creating customer for #{first_name} #{last_name}"
    end
  end
end