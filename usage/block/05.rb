def run_two_procs(a, b)
  a.call
  b.call
end


proc1 = Proc.new do
  puts "Proc1"
end

proc2 = Proc.new do
  puts "Proc2"
end

run_two_procs(proc1, proc2)