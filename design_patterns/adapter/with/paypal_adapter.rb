require_relative "../shared/paypal_lib"
require_relative "payment_adapter"

# frozen_string_literal: true

class PaypalAdapter < PaymentAdapter
  class << self
    def subscribe(user)
      PaypalLib.subscription(email: user.email)
    end

    def register(user)
      PaypalLib.customer(first_name: user.first_name, last_name: user.last_name)
    end
  end
end
