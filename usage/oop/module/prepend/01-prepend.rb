# frozen_string_literal: true

#
# prepend 會將 module 放到繼承鏈下方，可以想像越下方靠近使用者，越前面
#
module Bar
  def my_method
    'in module'
  end
end

#
# Foo prepend Bar，會讓 Bar < Foo。
# 會使得 Bar 去複寫 Foo 的同名方法。
#
class Foo
  prepend Bar

  def my_method
    'in class'
  end
end

x = Foo.new
p x.my_method # in module