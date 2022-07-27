# :reek:U

# other languages implement with data structure that store the variable reference and their value when closure is created.
# but ruby only a reference is kept, so the context can be changed before the proc has chance to run.

def run_proc(some_proc)
  some_proc.call
end

my_name = 'harry'
my_proc = proc { puts my_name }

my_name = 'jack'
run_proc(my_proc)