require 'benchmark/ips'

n = 5_000_000
Benchmark.ips do |x|
  x.report('A') { for i in 1..n; a = '1'; end }
  x.report('B') { n.times do   ; a = '1'; end }
  x.report('C') { 1.upto(n) do ; a = '1'; end }
end

__END__


Warming up --------------------------------------
                   A     1.000  i/100ms
                   B     1.000  i/100ms
                   C     1.000  i/100ms
Calculating -------------------------------------
                   A      4.879  (± 0.0%) i/s -     25.000  in   5.123687s
                   B      4.839  (± 0.0%) i/s -     25.000  in   5.166007s
                   C      4.765  (± 0.0%) i/s -     24.000  in   5.036398s
