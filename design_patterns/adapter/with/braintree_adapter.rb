require_relative "../shared/braintree_lib"
require_relative "payment_adapter"
# frozen_string_literal: true

class BraintreeAdapter < PaymentAdapter
  class << self
    def subscribe(user)
      BraintreeLib.subscribe(external_id: user.id)
    end

    def register(user)
      BraintreeLib.user(full_name: user.full_name)
    end
  end
end
