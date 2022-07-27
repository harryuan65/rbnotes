# :reek:U

# Method

def app(env)
  [200, {'Content-Type' => 'text/html; charset=utf-8'}, ["安安我不是哈利"]]
end

run method(:app)