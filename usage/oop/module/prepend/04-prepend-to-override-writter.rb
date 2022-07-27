#
# Prepend this to redefine writer, raise error when edit is toggled off
#
module EditProtection
  def enable_edits
    @editable = true
  end

  def disable_edits
    @editable = true
  end

  def self.prepended(klass)
    klass.instance_methods(false).select { |meth| meth =~ /\w\=$/ }.each do |meth|
      define_method(meth) do |*args, &block|
        if @editable
          super(*args, &block)
        else
          raise 'This object is not editable'
        end
      end
    end
  end
end

class User
  attr_accessor :name, :admin

  def initialize(name, admin)
    @name = name
    @admin = admin
  end

  prepend EditProtection
end


normal = User.new('Fred', false)
# normal.admin = true # in prepended': This object is not editable (RuntimeError)
normal.enable_edits
normal.admin = true
p normal.admin