# frozen_string_literal: true

#
# Include 會將 module 放到繼承鏈上方，產生繼承的效果。
#
module Bar
  def my_method
    10
  end
end

#
# Foo include Bar，效果同 Foo < Bar
#
class Foo
  include Bar
end

x = Foo.new
p x.my_method