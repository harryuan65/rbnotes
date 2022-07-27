# Factory 

適合解決

- 依條件來實體化物件
- 多種物件具有相同的行為（修改時就可以改一個 class 就好)


## Refactor example

```ruby
class Endpoint
  def home(params)
    user = if params[:user_type] == 'admin'
      Admin.new
    elsif params[:user_type] == 'member'
      Member.new
    else
      Guest.new
    end
    
    { first_name: user.first_name }.to_json
  end
end
```

本身看起來還好，但是當這段邏輯出現在其他地方時就會很亂。
1. 當你加上一個新的 type 就會發現說每個地方都要改。
2. 你必須隨時確保所有的 user 物件都有一樣的行為(可以對他們 call 同一個 method, e.g. `#first_name`)

```ruby
class Endpoint
  def home(params)
    user = if params[:user_type] == "admin"
      Admin.new
    elsif params[:user_type] == "member"
      Member.new
    else
      Guest.new
    end

    { first_name: user.first_name }.to_json
  end

  def contact(params)
    user = if params[:user_type] == "admin"
      Admin.new
    elsif params[:user_type] == "member"
      Member.new
    else
      Guest.new
    end

    name = [user.first_name, user.last_name].join(" ")
    { name: name }.to_json
  end
end
```

為了確保行為一致，我們將 User 抽成一個 base class，讓所有不同的 type 去繼承它。

```ruby
class UserBase
  def first_name = raise("Not implemented")
  def last_name = raise("Not implemented")
end

class Admin < UserBase; end
class Member < UserBase; end
class Guest < UserBase; end
```

將「條件式宣告」的邏輯抽到一個獨立的 factory class


```ruby
class UserFactory
  def self.call(params)
    if params[:user_type] == "admin"
      Admin.new
    elsif params[:user_type] == "member"
      Member.new
    else
      Guest.new
    end
  end
end

class Endpoint
  def home(params)
    user = UserFactory.call(params)
    { first_name: user.first_name }.to_json
  end

  def contact(params)
    user = UserFactory.call(params)
    name = [user.first_name, user.last_name].join(" ")
    { name: name }.to_json
  end
end
```