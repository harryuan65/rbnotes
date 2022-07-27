#
# Empty Class to test
#
class MyClass; end

MyClass.define_method "hi" do |e|
  puts "Try to say hi to #{e}"
end

MyClass.instance_methods # =>  [:hi, :untaint, :to_json, ...

me = MyClass.new
me.hi "you"
# Try to say hi to you

MyClass.singleton_class.define_method "hello" do |e|
  puts "Try to say hello to #{e}"
end

MyClass.methods # => [:hello, :yaml_tag, :new, :descendants, ...

MyClass.hello "Peter" # Try to say hello to Peter