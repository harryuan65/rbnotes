require 'benchmark'
require 'faker'

# Sample User
User = Struct.new(:name, :email_verified)

users = 50000.times.map do |i|
  User.new(Faker::Name.name, [true, false].sample)
end

Benchmark.bmbm(30) do |x|
  x.report('nil?') do
    users.map{ _1.email_verified.nil? }
  end

  x.report('!!some_thing') do
    users.map{ !!_1.email_verified }
  end
end



















__END__

Rehearsal ------------------------------------------------------------------
nil?                             0.003579   0.000055   0.003634 (  0.003630)
!some_thing                      0.003921   0.000051   0.003972 (  0.003988)
--------------------------------------------------------- total: 0.007606sec

                                     user     system      total        real
nil?                             0.003070   0.000011   0.003081 (  0.003077)
!some_thing                      0.003034   0.000002   0.003036 (  0.003031)

Rehearsal ------------------------------------------------------------------
nil?                             0.003663   0.000050   0.003713 (  0.003707)
!!some_thing                     0.004546   0.000037   0.004583 (  0.004586)
--------------------------------------------------------- total: 0.008296sec

                                     user     system      total        real
nil?                             0.003207   0.000005   0.003212 (  0.003209)
!!some_thing                     0.003443   0.000002   0.003445 (  0.003444)

# 差不多！
Rehearsal ------------------------------------------------------------------
nil?                             0.002977   0.000028   0.003005 (  0.003001)
!!some_thing                     0.003499   0.000030   0.003529 (  0.003529)
--------------------------------------------------------- total: 0.006534sec

                                     user     system      total        real
nil?                             0.002719   0.000056   0.002775 (  0.002793)
!!some_thing                     0.003596   0.000002   0.003598 (  0.003596)
