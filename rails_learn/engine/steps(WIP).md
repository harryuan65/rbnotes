# Engine

```bash
bundle exec rails plugin new cheese_api --mountable
```

:page_facing_up: cheese_api/lib/cheese_api/engine.rb
Acts as `config/application.rb`

```ruby
module CheeseApi
  class Engine < ::Rails::Engine
    isolate_namespace CheeseApi
  end
end
```
