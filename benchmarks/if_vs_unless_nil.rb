# frozen_string_literal: true
require 'benchmark'

TICKET_PRICE = 50

class AmusementParkWithIf
  def initialize(people_count = nil)
    @people_count = people_count
  end

  def revenue
    if @people_count
      return TICKET_PRICE * @people_count
    end

    0
  end
end

class AmusementParkWithUnlessNil
  def initialize(people_count = nil)
    @people_count = people_count
  end

  def revenue
    unless @people_count.nil?
      return TICKET_PRICE * @people_count
    end

    0
  end
end

Benchmark.bm(10) do |x|
  x.report('if') do
    3000000.times.each do |i|
      AmusementParkWithIf.new(i).revenue
    end
  end

  x.report('unless nil?') do
    3000000.times.each do |i|
      AmusementParkWithUnlessNil.new(i).revenue
    end
  end
end


__END__
                 user     system      total        real
if           0.330403   0.000632   0.331035 (  0.331198)
unless nil?  0.335563   0.001681   0.337244 (  0.337412)

#  不要用 unless nil?