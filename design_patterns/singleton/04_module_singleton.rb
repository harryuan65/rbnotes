# more close to singleton, because modules dont have new
class ModuleSingleton
  def self.name=(name)
    @name = name
  end

  def self.name
    @name
  end
end



ModuleSingleton.name = "harry"
puts ModuleSingleton.name