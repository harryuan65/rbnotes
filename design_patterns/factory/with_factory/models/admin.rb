require_relative "user_base"

class Admin < UserBase
  def ban(user)
    user.first_name = user.last_name = nil
  end
end
