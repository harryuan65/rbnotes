# frozen_string_literal: true

#
# Prepend this to override writter
#
module UserProtection
  attr_accessor :operator

  def name=(admin)
    if operator && operator.admin
      super
    else
      raise 'You do not have permissions to set this attribute'
    end
  end

  def admin=(admin)
    if operator && operator.admin
      super
    else
      raise 'You do not have permissions to set this attribute'
    end
  end
end

class User
  attr_accessor :name, :admin

  def initialize(name, admin)
    @name = name
    @admin = admin
  end

  prepend UserProtection
end

normal = User.new('Fred', false)
admin = User.new('Jill', true)

# normal.operator = normal # `admin=': You do not have permissions to set this attribute (RuntimeError)
normal.operator = admin # `admin=': You do not have permissions to set this attribute (RuntimeError)
normal.admin = true
p normal.admin