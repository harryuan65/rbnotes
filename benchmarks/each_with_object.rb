# frozen_string_literal: true
require 'benchmark'

data = 3_000_000.times.map do |i|
  {
    id: i,
    points: 100000,
  }
end

Benchmark.bmbm(18) do |x|
  x.report('each_with_object') do
    data.each_with_object({}) do |hash, res|
      res[hash[:id]] = hash[:points]
    end
  end

  x.report('each and object') do
    res = {}
    data.each do |hash|
      res[hash[:id]] = hash[:points]
    end
  end

  x.report('reduce') do
    data.reduce({}) do |res, hash|
      res[hash[:id]] = hash[:points]
      res
    end
  end
end

__END__

Rehearsal ------------------------------------------------------
each_with_object     0.751299   0.041590   0.792889 (  0.792967)
each and object      0.605038   0.035563   0.640601 (  0.642764)
reduce               0.642566   0.017201   0.659767 (  0.659809)
--------------------------------------------- total: 2.093257sec

                         user     system      total        real
each_with_object     0.560050   0.012591   0.572641 (  0.572656)
each and object      0.525839   0.014238   0.540077 (  0.540090)
reduce               0.616834   0.019180   0.636014 (  0.636429)


Rehearsal ------------------------------------------------------
each_with_object     0.747778   0.030835   0.778613 (  0.778765)
each and object      0.645633   0.035071   0.680704 (  0.682693)
reduce               0.642325   0.015437   0.657762 (  0.657776)
--------------------------------------------- total: 2.117079sec

                         user     system      total        real
each_with_object     0.557327   0.012624   0.569951 (  0.569952)
each and object      0.523657   0.013915   0.537572 (  0.537579)
reduce               0.562739   0.013292   0.576031 (  0.576053)



Rehearsal ------------------------------------------------------
each_with_object     0.735867   0.029652   0.765519 (  0.765546)
each and object      0.600176   0.025352   0.625528 (  0.627279)
reduce               0.693017   0.019784   0.712801 (  0.714282)
--------------------------------------------- total: 2.103848sec

                         user     system      total        real
each_with_object     0.556221   0.013410   0.569631 (  0.569677)
each and object      0.523974   0.014008   0.537982 (  0.538004)
reduce               0.559578   0.013725   0.573303 (  0.573365)
