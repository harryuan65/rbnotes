require_relative "../base"
require "faker"

class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :name

      t.timestamps
    end
  end
end

class CreateArticle < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, if_not_exists: true do |t|
      t.references :user
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end

CreateUser.new.change
CreateArticle.new.change

class User < ActiveRecord::Base
  has_many :articles
end

class Article < ActiveRecord::Base
  belongs_to :user
end

user = User.find_or_create_by!(name: "harry")
articles = if user.articles.count.zero?
            3.times.map { |i| user.articles.create!(title: "Article#{i}", content: Faker::Quote.matz) }
          else
            user.articles
          end

if __FILE__ == $0
  binding.irb
end