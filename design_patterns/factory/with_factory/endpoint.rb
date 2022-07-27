require_relative "factories/user_factory"

class Endpoint
  def home(params)
    user = UserFactory.call(params)

    { event: "A(n) #{user.class} visited home page", first_name: user.first_name }.to_json
  end

  def contact(params)
    user = UserFactory.call(params)

    name = [user.first_name, user.last_name].join(" ")
    { event: "A(n) #{user.class} visited contact page", name: name }.to_json
  end
end

endpoint = Endpoint.new
puts endpoint.home({ user_type: "guest" })
puts endpoint.contact({ user_type: "member" }) # "A(n) Member visited contact page" 不需要擔心重複程式碼，造成可能遺漏的問題
