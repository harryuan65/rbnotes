require_relative "user_base"

class Member < UserBase
  def receive_bonus
    puts "Welcome! This is your monthly bonus"
  end
end
