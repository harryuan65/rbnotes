class Foo
  def my_method
    'inside class'
  end
end


module Bar
  def my_method
    'in module'
  end

  def self.enhance(klass)  # this means we can dynamically prepend the modules
    prepend_features Foo
  end
end

x = Foo.new
puts x.my_method

Bar.enhance Foo
puts x.my_method

# inside class
# in module