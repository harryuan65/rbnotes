require 'pry'
module Events
  def self.included(base)
    base.class_eval do
      include B, A
    end
  end
end

module A
  def rank_a
    puts "rank_a"
  end
end

module B
  def rank_b
    puts "rank_b"
  end
end

class MyClass
  include Events
end

binding.pry