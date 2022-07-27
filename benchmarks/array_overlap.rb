# frozen_string_literal: true

# 'https://gist.github.com/jrunning/33e5168306e4b51aa41a6df7458827b2'

require "benchmark/ips"

A_SIZE_RANGE = 0..1000
B_SIZE_RANGE = 2..5
VAL_RANGE = 0...10000

def a
  Array.new(rand A_SIZE_RANGE) { rand VAL_RANGE }
end

def b
  Array.new(rand B_SIZE_RANGE) { rand VAL_RANGE }
end

Benchmark.ips(35) do |x|
  x.report("(a&b).any?") { (a & b).any? }
  x.report("any? include?") { a.any? {|item| b.include?(item) } }
  x.report("a - b view size") { (a - b).size != a.size }
  x.compare!
end

__END__

Warming up --------------------------------------
          (a&b).any?             2.057k i/100ms
        any? include?          360.000  i/100ms

Calculating -------------------------------------
          (a&b).any?          20.533k (± 1.3%) i/s -    719.950k in  35.069102s
        any? include?          3.757k (± 3.2%) i/s -    131.400k in  35.012687s

Comparison:
          (a&b).any?:           20533.1 i/s
        any? include?:           3756.7 i/s - 5.47x  (± 0.00) slower




Warming up --------------------------------------
          (a&b).any?     2.035k i/100ms
       any? include?   360.000  i/100ms
     a - b view size     1.001k i/100ms
Calculating -------------------------------------
          (a&b).any?     20.555k (± 1.4%) i/s -    720.390k in  35.052833s
       any? include?      3.752k (± 3.3%) i/s -    131.400k in  35.061527s
     a - b view size     10.613k (± 1.5%) i/s -    372.372k in  35.092718s

Comparison:
          (a&b).any?:    20555.4 i/s
     a - b view size:    10613.3 i/s - 1.94x  (± 0.00) slower
       any? include?:     3751.7 i/s - 5.48x  (± 0.00) slower

