# frozen_string_literal: true

require_relative "paypal_adapter"
require_relative "braintree_adapter"
require_relative "../shared/user"

class ClientApp
  # @param [#subscribe, #register] platform Adapters
  def self.call(platform:, user:)
    platform.subscribe(user)
    platform.register(user) # Disallow modification
  end
end

ClientApp.call(platform: BraintreeAdapter, user: User.new)
ClientApp.call(platform: PaypalAdapter, user: User.new)
# Allow extension
