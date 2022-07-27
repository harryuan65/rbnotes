require 'benchmark'

# Use getter method for instance var
class PersonWithGetterMethod
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

# Use attr reader method for instance var
class PersonWithAttrReader
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

person1 = PersonWithGetterMethod.new('harry')
person2 = PersonWithAttrReader.new('harry')

Benchmark.bm do |x|
  x.report('getter method') { 3_000_000.times.each { person1.name } }
  x.report('attr reader') {   3_000_000.times.each { person2.name } }
end

__END__
               user     system      total        real
getter method  0.109568   0.000398   0.109966 (  0.109993)
attr reader    0.090620   0.000097   0.090717 (  0.090728)
