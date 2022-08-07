# frozen_string_literal: true

require_relative "../shared/paypal_lib"
require_relative "../shared/user"

class ClientApp
  def self.call(user:)
    # Tightly coupled with paypal_lib
    PaypalLib.subscription(email: user.email)
    PaypalLib.customer(first_name: user.first_name, last_name: user.last_name)
  end
end

ClientApp.call(user: User.new)
