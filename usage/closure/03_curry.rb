# :reek:U

# Dynamically defined the behaviour
def multply(first_arg)
  lambda do |second_arg|
    lambda do |third_arg|
      first_arg * second_arg * third_arg
    end
  end
end


puts multply(2)[3][4]