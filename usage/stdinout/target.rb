# https://stackoverflow.com/questions/29998728/what-stdout-sync-true-means
# Normally puts does not write immediately to STDOUT, but buffers the strings internally and writes the output in bigger chunks. This is done because IO operations are slow and usually it makes more sense to avoid writing every single character immediately to the console.
# This behavior leads to problems in certain situations. Imagine you want to build a progress bar (run a loop that outputs single dots between extensive calculations). With buffering the result might be that there isn't any output for a while and then suddenly multiple dots are printed at once.
# To avoid this behavior and instead write immediately to STDOUT you can set STDOUT into sync mode like this:

$stdin.sync = true
$stdout.sync = true

while true
  guess = (rand * 10).to_i
  puts "Is it #{guess}?"
  if gets.chomp[/Success/]
    puts "Win YEAH"
    exit
  end
end