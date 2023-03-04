# rake -f usage/rake/basic.rake "intro[harry,yuan]"
namespace :hello do

  task :hi do
    puts "Please introduce yourself"
  end

  task :cringe do
    puts "Uh... OK"
  end

  task :intro, [:first_name, :last_name] => [:hi, :cringe] do |task_name, args|
    puts "this task is #{task_name}"
    puts args.first_name
    puts args.last_name
  end
end

task :aaa do
  puts "+aaa"
  puts "~aaa"
end

task :middle do
  puts "middle"
end

task bbb: :aaa do
  puts "+bbb"
  Rake::Task["middle"].invoke
  puts "~bbb"
end

Rake::Task["bbb"].enhance do
  puts "CCC"
end