# frozen_string_literal: true

# @abstract Override subscribe and register for unified interface
class PaymentAdapter
  class << self
    def subscribe = raise(NotImplementedError)
    def register = raise(NotImplementedError)
  end
end
