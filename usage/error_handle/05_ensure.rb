# frozen_string_literal: true

# 捕捉任何 exception
begin
  a = 1/0
rescue TypeError
  puts '發生型別錯誤的問題'
ensure
  puts 'Well, 不管怎樣我試過了，跟你說一下'
end

puts '抵達不了這行'