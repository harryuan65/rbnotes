require "faker"

class Member
  attr_accessor :first_name, :last_name

  def initialize(first_name = Faker::Name.first_name, last_name = Faker::Name.last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def receive_bonus
    puts "Welcome! This is your monthly bonus"
  end
end
