ConstantSingleton = Struct.new(:name)

SINGLETON_OBJ = ConstantSingleton.new("harry")

puts SINGLETON_OBJ.name