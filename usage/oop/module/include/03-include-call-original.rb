# frozen_string_literal: true

#
# Include 會將 module 放到繼承鏈上方，產生繼承的效果。
#
module Bar
  def my_method
    puts 'in module'
  end
end

#
# 因為等同 Foo < Bar，可以透過 super 呼叫原本 Bar 的方法
#
class Foo
  include Bar

  def my_method
    puts 'in class'
    super  # bar is in the higher position
  end
end

x = Foo.new
p x.my_method
# in class
# in module