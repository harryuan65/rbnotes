# :reek:U
# dynamically defined the behaviour
def multiple_generator(m)
  lambda do |n|
    n * m
  end
end

doubler = multiple_generator(2)
tripler = multiple_generator(3)

puts doubler[5]
puts tripler[10]

puts multiple_generator(2)[3]