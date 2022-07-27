# frozen_string_literal: true

# 捕捉任何 exception
begin
  a = 1/0
rescue => exception
  puts exception
  puts exception.class
end

puts '安全抵達'