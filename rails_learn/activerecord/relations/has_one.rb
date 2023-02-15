require_relative "../base"

class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, if_not_exists: true do |t|
      t.references :user
      t.string :bio
      t.timestamps
    end
  end
end

CreateUser.new.change
CreateProfile.new.change

class User < ActiveRecord::Base
  has_one :profile
end

class Profile < ActiveRecord::Base
  belongs_to :user
end

user = User.find_or_create_by!(name: "harry")
profile = Profile.find_or_create_by!(user: user, bio: "Hello")

if __FILE__ == $0
  binding.irb
end