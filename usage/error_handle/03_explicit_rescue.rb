# frozen_string_literal: true

# 捕捉任何 exception
begin
  a = 1/0
rescue StandardError
  puts '發生了問題'
end

puts '安全抵達'