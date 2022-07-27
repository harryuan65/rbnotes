
# Monkey Patch
class Array
  def random_each(&b)
    p b # What is b ??
    shuffle.each do |e|
      b.call e       # Use block explicitly!
    end
  end
end

[1,2,3,4,5].random_each do |e|
  puts e
end


# b => Proc