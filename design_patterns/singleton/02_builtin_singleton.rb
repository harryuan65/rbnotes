require "singleton"

class BuiltinSingleton
  include Singleton

  attr_accessor :name
end


user = BuiltinSingleton.instance

user.name = "harry"
puts user.name # "harry"

new_user = BuiltinSingleton.instance
puts new_user.name # "harry"