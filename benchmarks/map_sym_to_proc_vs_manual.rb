require 'benchmark'

Benchmark.bmbm do |x|
  x.report('to_s') do
    10000.times.map { |s| s.to_s }
  end
  x.report('symbol') do
    10000.times.map(&:to_s)
  end
end