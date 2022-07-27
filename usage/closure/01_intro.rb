# :reek:UtilityFunction

# Closure
# A function that maintains reference to local variable where it is defined
def run_proc(some_proc)
  some_proc.call # p is called here, but where is name?? it is somehow alive again
end

name = "Fred"
print_a_name = proc { puts name }
run_proc print_a_name