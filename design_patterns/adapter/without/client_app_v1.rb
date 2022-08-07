# frozen_string_literal: true

require_relative "../shared/paypal_lib"
require_relative "../shared/braintree_lib"
require_relative "../shared/user"

class ClientApp
  def self.call(platform:, user:)
    # Want to extend the app the support another platform
    if platform == :paypal
      PaypalLib.subscription(user.email)
      PaypalLib.customer(first_name: user.first_name, last_name: user.last_name)
    elsif platform == :braintree # Violates Open close principle
      BraintreeLib.user(full_name: user.full_name)
      BraintreeLib.subscribe(external_id: user.id)
    else
      raise "Wrong platform"
    end
  end
end

ClientApp.call(platform: :braintree, user: User.new)
ClientApp.call(platform: :paypal, user: User.new)
