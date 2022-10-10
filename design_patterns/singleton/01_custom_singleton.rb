class CustomSingleton
  private_class_method :new

  def initialize(name)
    @name = name
  end

  #
  # Returns the cached instance
  #
  # @param [String] name
  def self.instance(name)
    @instance ||= new(name)
  end
end

puts CustomSingleton.instance("Harry").name
puts CustomSingleton.instance("Jack").name # cached, still Harry