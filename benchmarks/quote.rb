require "benchmark"

# standard:disable Style/StringLiterals(Standard)
Benchmark.bmbm do |x|
  x.report('single quote') do
    0.upto(100000) do |i|
      '1' + '2'
    end
  end

  x.report('double quote') do
    0.upto(100000) do |i|
      "1" + "2"
    end
  end
end
# standard:enable Style/StringLiterals(Standard)

__END__
Rehearsal ------------------------------------------------
single quote   0.009331   0.000025   0.009356 (  0.009356)
double quote   0.008910   0.000006   0.008916 (  0.008917)
--------------------------------------- total: 0.018272sec

                   user     system      total        real
single quote   0.008888   0.000003   0.008891 (  0.008890)
double quote   0.008889   0.000005   0.008894 (  0.008893)

Rehearsal ------------------------------------------------
single quote   0.009834   0.000204   0.010038 (  0.010042)
double quote   0.009087   0.000127   0.009214 (  0.009218)
--------------------------------------- total: 0.019252sec

                   user     system      total        real
single quote   0.008921   0.000063   0.008984 (  0.008989)
double quote   0.008934   0.000067   0.009001 (  0.008999)

Rehearsal ------------------------------------------------
single quote   0.009788   0.000207   0.009995 (  0.010006)
double quote   0.009046   0.000214   0.009260 (  0.009262)
--------------------------------------- total: 0.019255sec

                   user     system      total        real
single quote   0.009064   0.000118   0.009182 (  0.009197)
double quote   0.009060   0.000121   0.009181 (  0.009196)
Rehearsal ------------------------------------------------
single quote   0.009322   0.000044   0.009366 (  0.009360)
double quote   0.008914   0.000002   0.008916 (  0.008919)
--------------------------------------- total: 0.018282sec

                   user     system      total        real
single quote   0.009039   0.000007   0.009046 (  0.009061)
double quote   0.008894   0.000016   0.008910 (  0.008912)
