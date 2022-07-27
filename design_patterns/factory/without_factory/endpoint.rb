require_relative "models/admin"
require_relative "models/member"
require_relative "models/guest"

class Endpoint
  def home(params)
    user = if params[:user_type] == "admin"
             Admin.new
           elsif params[:user_type] == "member"
             Member.new
           else
             Guest.new
           end

    { event: "A(n) #{user.class} visited home page", first_name: user.first_name }.to_json
  end

  def contact(params)
    user = if params[:user_type] == "admin"
             Admin.new
           elsif params[:user_type] == "memer"
             Member.new
           else
             Guest.new
           end

    name = [user.first_name, user.last_name].join(" ")
    { event: "A(n) #{user.class} visited contact page", name: name }.to_json
  end
end

endpoint = Endpoint.new
puts endpoint.home({ user_type: "guest" })
puts endpoint.contact({ user_type: "member" }) # "A(n) Guest visited contact page" 沒噴錯但是因為後來的工程師沒複製到，少一個字
