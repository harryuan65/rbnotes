require 'benchmark'
# https://gist.github.com/jacobdam/5864997

Benchmark.bmbm do |x|

  x.report('Break') do
    1_000_000.times do
      loop { break }
    end
  end

  x.report('Catch/Throw') do
    1_000_000.times do
      catch(:benchmarking) do
        throw(:benchmarking)
      end
    end
  end

  x.report('Raise/Rescue') do
    1_000_000.times do
      begin
        raise StandardError
      rescue
        # do nothing
      end
    end
  end

  x.report('Raise/Rescue no backtrace') do
    empty_backtrace = []
    1_000_000.times do
      begin
        raise StandardError, '', empty_backtrace
      rescue
        # do nothing
      end
    end
  end

end

__END__

Rehearsal -------------------------------------------------------------
Break                       0.124190   0.000439   0.124629 (  0.124745)
Catch/Throw                 0.153119   0.000483   0.153602 (  0.153644)
Raise/Rescue                0.497894   0.007366   0.505260 (  0.506834)
Raise/Rescue no backtrace   0.285803   0.001806   0.287609 (  0.287768)
---------------------------------------------------- total: 1.071100sec

                                user     system      total        real
Break                       0.124132   0.001025   0.125157 (  0.125256)
Catch/Throw                 0.155642   0.001783   0.157425 (  0.157528)
Raise/Rescue                0.477750   0.008545   0.486295 (  0.486716)
Raise/Rescue no backtrace   0.278376   0.000778   0.279154 (  0.279292)
