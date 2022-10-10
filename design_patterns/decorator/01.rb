# Class wrapper

class Person
  def feeling_at(outside_temp)
    if outside_temp >= 20
      "Hot"
    else
      "Cold"
    end
  end
end

class Shirt
  def initialize(person)
    @person = person
  end

  def feeling_at(outside_temp)
    if outside_temp >= 30
      "Go for a swim"
    else
      @person.feeling_at(outside_temp)
    end
  end
end

class Coat
  def initialize(person)
    @person = person
  end

  def feeling_at(outside_temp)
    if outside_temp >= 35
      "Crazy hot"
    else
      @person.feeling_at(outside_temp)
    end
  end
end

# Need to synchronize the object's interface
outside_temp = 30

person = Person.new
puts person.feeling_at(outside_temp)
person = Shirt.new(person)
puts person.feeling_at(outside_temp)
person = Coat.new(person)
puts person.feeling_at(outside_temp)
puts "Class: #{person.class}"
