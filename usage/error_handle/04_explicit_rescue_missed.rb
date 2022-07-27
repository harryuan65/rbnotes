# frozen_string_literal: true

# 捕捉任何 exception
begin
  a = 1/0
rescue TypeError
  puts '發生型別錯誤的問題'
end

puts '抵達不了這行'