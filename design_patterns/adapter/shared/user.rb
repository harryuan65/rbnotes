# frozen_string_literal: true

class User
  attr_reader :first_name, :last_name, :email, :id, :full_name

  def initialize
    @first_name = "harry"
    @last_name = "yuan"
    @email = "harryuanfake@gmail.com"
    @id = "123"
    @full_name = @first_name + @last_name
  end
end
