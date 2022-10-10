class ClassSingleton
  def self.name=(name)
    @name = name
  end

  def self.name
    @name
  end
end

ClassSingleton.name = "harry"
puts ClassSingleton.name