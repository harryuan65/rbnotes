#
# Test class
#
class MyClass
  def initialize
    @apple = "Red Apple"
  end
end
me = MyClass.new
# => #<MyClass:0x00007fd65818bc68 @apple="Red Apple">
puts me.instance_variable_defined?(:@apple)
# => true

puts me.instance_variable_get(:@apple)  # Dont use this, set attr_reader/ attr_writer / attr_accessor
# "Red Apple"

puts me.instance_variables
# => [:@apple]