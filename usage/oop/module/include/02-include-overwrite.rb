# frozen_string_literal: true

#
# Include 會將 module 放到繼承鏈上方，產生繼承的效果。
#
module Bar
  def my_method
    'in module'
  end
end

#
# 因為效果同 Foo < Bar，可以在 Foo 複寫實體方法。
#
class Foo
  include Bar

  def my_method
    'in class'
  end
end

x = Foo.new
p x.my_method # in class