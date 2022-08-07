# frozen_string_literal: true

class BraintreeLib
  class << self
    def user(full_name:)
      puts "Creating braintree with user #{full_name}"
    end

    def subscribe(external_id:)
      puts "Creating subscription for ID:#{external_id}"
    end
  end
end
