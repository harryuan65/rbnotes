require 'benchmark'

BIG_ARRAY = (0..1_00_000).to_a

Benchmark.bmbm do |x|
  x.report("#push with splat") do
    a = BIG_ARRAY.dup
    b = BIG_ARRAY.dup
    a.push(*b)
  end

  x.report("#concat") do
    a = BIG_ARRAY.dup
    b = BIG_ARRAY.dup
    a.concat(b)
  end
end

__END__
Rehearsal ----------------------------------------------------
#push with splat   0.000066   0.000180   0.000246 (  0.000243)
#concat            0.000041   0.000099   0.000140 (  0.000140)
------------------------------------------- total: 0.000386sec

                       user     system      total        real
#push with splat   0.000057   0.000104   0.000161 (  0.000160)
#concat            0.000038   0.000076   0.000114 (  0.000114)
