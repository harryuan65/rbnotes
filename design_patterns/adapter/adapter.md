# Adapter

Align different interfaces to make feature extension easy.

## 資源

### External Library 1: Braintree

```ruby
# /shared/braintree_lib.rb
# frozen_string_literal: true

class BraintreeLib
  class << self
    def user(full_name:)
      puts "Creating braintree with user #{full_name}"
    end

    def subscribe(external_id:)
      puts "Creating subscription for ID:#{external_id}"
    end
  end
end
```

### External Library 2: Paypal

```ruby
# /shared/paypal_lib.rb
# frozen_string_literal: true

class PaypalLib
  class << self
    def subscription(email:)
      puts "Creating subscription for email: #{email}"
    end

    def customer(first_name:, last_name:)
      puts "Creating customer for #{first_name} #{last_name}"
    end
  end
end
```

### Shared: Model

```ruby
# /shared/user.rb
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
```

## Initial Code

我們的 App 會使用到 Paypal 的支付功能，會使用到 user 來訂閱和新增顧客。整體看起來沒什麼問題。

```ruby
require_relative "../shared/paypal_lib"
require_relative "../shared/user"
# frozen_string_literal: true

class ClientApp
  def self.call(user:)
    PaypalLib.subscription(email: user.email)
    PaypalLib.customer(first_name: user.first_name, last_name: user.last_name)
  end
end

ClientApp.call(user: User.new)
```

## New Feature

若今天想要新增一個支付功能 -- Braintree。新手應該也會像範例一樣想直接增加一個平台檢查：

```ruby
# frozen_string_literal: true

require_relative "../shared/paypal_lib"
require_relative "../shared/braintree_lib"
require_relative "../shared/user"

class ClientApp
  def self.call(platform:, user:)
    if platform == :paypal
      PaypalLib.subscription(user.email)
      PaypalLib.customer(first_name: user.first_name, last_name: user.last_name)
    elsif platform == :braintree
      BraintreeLib.user(full_name: user.full_name)
      BraintreeLib.subscribe(external_id: user.id)
    else
      raise "Wrong platform"
    end
  end
end

ClientApp.call(platform: :braintree, user: User.new)
ClientApp.call(platform: :paypal, user: User.new)
```

如果照這個樣子，未來的擴充我們都必須修改舊有的邏輯。但這樣很不好，因為違反 Open Close Principle（只開放擴充、不允許修改），萬一我們加了新功能卻把舊的弄壞怎麼辦？我們是否可以不要因為加了新功能，而修改到原本的程式碼？

## Adapter Pattern

為兩個不同的套件，建立相同的 adapter，對外都暴露一樣的方法，並透過介面管控統一方法名稱。

```ruby
require_relative "../shared/braintree_lib"
require_relative "payment_adapter"
# frozen_string_literal: true

class BraintreeAdapter < PaymentAdapter
  class << self
    def subscribe(user)
      BraintreeLib.subscribe(external_id: user.id)
    end

    def register(user)
      BraintreeLib.user(full_name: user.full_name)
    end
  end
end
```

```ruby
require_relative "../shared/paypal_lib"
require_relative "payment_adapter"

# frozen_string_literal: true

class PaypalAdapter < PaymentAdapter
  class << self
    def subscribe(user)
      PaypalLib.subscription(email: user.email)
    end

    def register(user)
      PaypalLib.customer(first_name: user.first_name, last_name: user.last_name)
    end
  end
end
```

```ruby
# frozen_string_literal: true

require_relative "paypal_adapter"
require_relative "braintree_adapter"
require_relative "../shared/user"

class ClientApp
  # @param [#subscribe, #register] platform Adapters
  def self.call(platform:, user:)
    platform.subscribe(user)
    platform.register(user) # Disallow modification
  end
end

ClientApp.call(platform: BraintreeAdapter, user: User.new)
ClientApp.call(platform: PaypalAdapter, user: User.new)
# Allow extension

```

## Reference

這個範例引用自 [The adapter Pattern in Ruby](https://www.youtube.com/watch?v=cuFTu65Lp6o)，我覺得他的範例已經很實用也很好理解，直接借過來筆記，我最後只有修改一點點。推薦這位大大的頻道！
