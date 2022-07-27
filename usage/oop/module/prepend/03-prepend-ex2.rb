module ServiceDebugger
  #
  # Record stuff from overridden method 'run'
  #
  # @param [<Type>] args <description>
  #
  # @return [<Type>] <description>
  #
  def run(args)
    puts "Service run start: #{args.inspect}"
    result = super
    puts "Service run finished: #{result}"
  end
end

#
# Some service
#
class Service
  prepend ServiceDebugger

  # perform some real work
  def run(args)
    args.each do |arg|
      sleep 1
    end
    {result: "ok"}
  end

end

Service.new.run([:start, :load_data])