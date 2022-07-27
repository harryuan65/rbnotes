require 'benchmark'
require 'faker'

# frozen_string_literal: true

class User
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

users = 50_000.times.map { User.new(Faker::Name.name, [*10..70].sample) }

Benchmark.bmbm do |x|
  x.report('flat_map') { users.flat_map { |user| [user.name, user.age] } }
  x.report('each_with_object') do
    users.each_with_object([]) do |user, res|
      res << user.name
      res << user.age
    end
  end
end

__END__

Rehearsal ----------------------------------------------------
flat_map           0.003888   0.000112   0.004000 (  0.003996)
each_with_object   0.003658   0.000061   0.003719 (  0.003719)
------------------------------------------- total: 0.007719sec

                       user     system      total        real
flat_map           0.003566   0.000012   0.003578 (  0.003574)
each_with_object   0.003364   0.000035   0.003399 (  0.003399)

Rehearsal ----------------------------------------------------
flat_map           0.003971   0.000155   0.004126 (  0.004121)
each_with_object   0.003768   0.000079   0.003847 (  0.003849)
------------------------------------------- total: 0.007973sec

                       user     system      total        real
flat_map           0.003519   0.000136   0.003655 (  0.003653)
each_with_object   0.003446   0.000006   0.003452 (  0.003448)
