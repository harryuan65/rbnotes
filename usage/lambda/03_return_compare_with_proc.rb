# Returns differently
# Procs try to return from the context
def run_proc(p)
  puts "Starts"
  p.call
  puts "Ends"
end

run_proc(proc { puts "Proc"; return })
run_proc(lambda { puts "Lambda"; return }) # this line never runs