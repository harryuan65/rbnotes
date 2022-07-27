class Ranking
  EVENT_PACKAGES = [
    'night','beauty','green','ghost','shoppingfestival','cvd','lottery','party8','dessert',
    'chat','massage','lovetempo','fans','godfather','movie','sup','up','pet','lottery2'
  ]

  def initialize(event_name)
    @event_name = event_name
    @details = {}
    @meta = {}
  end

  def perform
    events = Regexp.union(EVENT_PACKAGES)
    match_data = str.match(events)
    if match_data
      event_package = match_data[0].to_sym
      method(event_package).call
    else
      raise StandardError, 'Invalid Event'
    end
  end

  def night
    puts "got night"
  end

  def shoppingfestival
    puts "got shoppingfestival"
  end

  def lottery
    puts "got lottery"
  end

  def party8
    puts "got party8"
  end

  def chat
    puts "got chat"
  end

  def fans
    puts "got fans"
  end

  def godfather
    puts "got godfather"
  end

  def movie
    puts "got movie"
  end

  def sup
    puts "got sup"
  end

  def up
    puts "got up"
  end

  def lottery2
    puts "got lottery2"
  end
end

Ranking.new("massage_donators")