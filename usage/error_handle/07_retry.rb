# frozen_string_literal: true

# Failed to pass the interview.
# We raise an exception because that is too sad
class InterviewFailed < StandardError; end

# Company to be interviewed
class Company
  attr_reader :name, :required_years
  def initialize(name, required_years)
    @name = name
    @required_years = required_years
  end
end

# A programmer that can interview a company
class Programmer
  def initialize(name, work_years)
    @name = name
    @work_years = work_years
  end

  # 面試囉
  # @param [Company] company 要面試的公司
  # @return [NilClass]
  def interview(company)
    company_name = company.name
    say("面試 #{company_name} 囉！")

    if @work_years >= company.required_years
      say("#{company_name} 過了!!!")
    else
      raise InterviewFailed.new("嗚嗚我被 #{company_name} 刷掉了QQ")
    end
  end

  def say(message)
    puts "我：#{message}"
  end
end

me = Programmer.new('harry', 2)
company = Company.new('Google', 5)

begin
  tried_count ||= 1

  me.interview(company)
rescue InterviewFailed => exception
  me.say(exception.to_s)

  if (tried_count += 1) < 5
    me.say "(retry) 我不信我過不了，林北要再試一次"
    retry
  end

  me.say("幹，我要搬回去老家住了")
ensure
  me.say("不管有沒有過，我盡力了")
end
