
# Monkey Patch
class Array
  def random_each
    shuffle.each do |e|
      yield e # block passed into random_each
    end
  end
end

[1,2,3,4,5].random_each do |e|
  puts e
end