require 'pry'
require_relative './mods/rank_a.rb'
require_relative './mods/rank_b.rb'

#
# include Events 的話就會另外 include 其他兩個 Module。
#
module Events
  def self.included(base)
    base.class_eval do
      include RankB, RankA
    end
  end
end

#
# 測試 Include
#
class MyClass
  include Events
end

binding.pry