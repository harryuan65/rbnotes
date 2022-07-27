hello = lambda do
  puts "Hello from lambda block"
end

hello2 = -> { puts "hello from lambda inline" }
hello3 = ->(arg) { puts "hello from inline with arg: #{arg}" }

hello.call
hello2.call
hello3.call(9999)