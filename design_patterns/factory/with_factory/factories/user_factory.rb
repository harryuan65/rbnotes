require_relative "../models/admin"
require_relative "../models/member"
require_relative "../models/guest"

class UserFactory
  def self.call(params)
    if params[:user_type] == "admin"
      Admin.new
    elsif params[:user_type] == "member"
      Member.new
    else
      Guest.new
    end
  end
end
