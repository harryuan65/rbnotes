mye = Enumerator.new do |en|
  1.upto(100) do |i|
    puts "passing #{i}"
    en << i if i %15==0
    puts "----------"
  end
end

puts mye.next
# output:

# passing 1
# ----------
# passing 2
# ----------
# passing 3
# ----------
# passing 4
# ----------
# passing 5
# ----------
# passing 6
# ----------
# passing 7
# ----------
# passing 8
# ----------
# passing 9
# ----------
# passing 10
# ----------
# passing 11
# ----------
# passing 12
# ----------
# passing 13
# ----------
# passing 14
# ----------
# passing 15