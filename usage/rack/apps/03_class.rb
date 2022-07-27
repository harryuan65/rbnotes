# :reek:U

# Use class instance
class App
  def call(env)
    [200, {'Content-Type' => 'text/html; charset=utf-8'}, ["安安我是 App"]]
  end
end

run App.new