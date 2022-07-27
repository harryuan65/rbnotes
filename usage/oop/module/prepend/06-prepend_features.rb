#
# 普通的 class
#
class Foo
  def my_method
    puts 'inside class'
  end
end


#
# 從 Module 這邊 Override Class 範例
#
module Bar
  def my_method
    puts 'in module'
  end

  # 跟 Foo prepend Bar 一樣，只是是
  # 直接在 Module 這邊蓋掉 class 的 instance method，我覺得有點壞
  prepend_features Foo
end

x = Foo.new
puts x.my_method