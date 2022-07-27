my_proc = Proc.new do |a|
  puts "This is a proc #{a} is passed in"
end

my_proc.call(10)

my_proc.(20) # synonym for .call

my_proc[30]

my_proc === 40 # case equality, see below


# === is true for proc when it returns true
several = Proc.new {|n| n > 3 && n < 8}
many    = Proc.new {|n| n > 3 && n < 8}
few = Proc.new {|n| n == 3 }
couple = Proc.new {|n| n == 2 }
none  = Proc.new {|n| n == 0 }

0.upto(10) do |n|
  print "number #{n} is "
  case n
  when several
    puts 'several'
  when many
    puts 'many'
  when few
    puts 'few'
  when couple
    puts 'couple'
  when none
    puts 'none'
  when 5    # it checks 5 === n
    puts 5
  else
    puts 'awesome'
  end
end