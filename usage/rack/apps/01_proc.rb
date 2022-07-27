# Proc

run Proc.new { |env| [200, {'Content-Type' => 'text/html; charset=utf-8'}, ["安安我是哈利"]]}

# run 是
# Rack::Handler.default.run

# 如果今天有裝不一樣的 Rack Server，例如 Puma
# 則會是 Rack::Handler::Puma.run