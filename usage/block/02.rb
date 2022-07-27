def run_block
  yield
end

run_block do
  puts 'Yoyo'
end

# run_block  # Error => no block given (yield) (LocalJumpError)

def run_block2
  yield if block_given?
end

run_block2
