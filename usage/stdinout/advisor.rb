# ruby advisor.rb target.rb
IO.popen(["ruby", ARGV.first], "r+") do |io|
  puts "[Advisor]Running Advisor..."
  answer = (rand * 10).to_i

  io.each_line do |line|
    puts "< #{line}"
    guess = line[/\d+/]
    if guess == answer.to_s
      io.puts "> Success"
    else
      io.puts "> Failed"
    end
  end
end
