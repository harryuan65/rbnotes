# frozen_string_literal: true

begin
  file = File.open('./a_file_not_exist.txt', 'w')
  10.downto(0) do |i|
    file << 10 / i
    file << "\n"
  end
ensure
  file << '發生錯誤。未正常寫入資料。'
  file.close
  puts 'Well, 不管怎樣檔案都要正常地關掉！'
end

puts '抵達不了這行'