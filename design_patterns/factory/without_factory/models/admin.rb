require "faker"

class Admin
  attr_accessor :first_name, :last_name

  def initialize(first_name = Faker::Name.first_name, last_name = Faker::Name.last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def ban(user)
    user.first_name = user.last_name = nil
  end
end
