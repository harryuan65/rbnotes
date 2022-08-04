# frozen_string_literal: true

require "benchmark"
require "faker"

DATA = 10_000.times.map do |_i|
  { trainer: Faker::Name.name }
end

EXTRA_DATA = 1000.times.each_with_object({}) do |_, res|
  100.times.map do |i|
    res[i] = Faker::Name.name
  end
end

Benchmark.bmbm do |x|
  x.report("expand") do
    DATA.map do |data|
      {
        **data, **EXTRA_DATA
      }
    end
  end

  x.report("merge") do
    DATA.map do |data|
      data.merge(EXTRA_DATA)
    end
  end
end

__END__

Rehearsal ------------------------------------------
expand   0.044356   0.001540   0.045896 (  0.045894)
merge    0.035819   0.001796   0.037615 (  0.038025)
--------------------------------- total: 0.083511sec

             user     system      total        real
expand   0.039867   0.001328   0.041195 (  0.041192)
merge    0.035088   0.001118   0.036206 (  0.036206)
