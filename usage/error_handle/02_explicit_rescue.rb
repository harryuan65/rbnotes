# frozen_string_literal: true

# 捕捉任何 exception
begin
  a = 1/0
rescue ZeroDivisionError
  puts '發生了除以 0 問題'
end

puts '安全抵達'