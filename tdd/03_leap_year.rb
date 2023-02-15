# 西元年分除以 400 可整除，為閏年。
# 西元年分除以 100 可整除但除以 400 不可整除，為平年
# 西元年分除以 4 可整除但除以 100 不可整除，為閏年。
# 西元年分除以 4 不可整除，為平年。

class LeapYearTeller
  attr_reader :year
  def initialize(year)
    @year = year
  end

  def is_leap?
    year % 400 == 0 || year % 4 == 0 && year % 100 > 0
  end
end


TEST_CASES = [
  { input: 1700, output: false },
  { input: 1800, output: false },
  { input: 1900, output: false },
  { input: 1988, output: true },
  { input: 1992, output: true },
  { input: 1996, output: true },
  { input: 2012, output: true },
  { input: 2019, output: false },
  { input: 2020, output: true },
  { input: 2023, output: false },
  { input: 2024, output: true },
  { input: 2100, output: false },
  { input: 2200, output: false },
  { input: 2400, output: true },
]
RSpec.describe LeapYearTeller do
  TEST_CASES.each do |tc|
    case tc
      in { input: input, output: output }

      it "says #{input} should #{output ? "" : "NOT"}be a leap year" do
        expect(described_class.new(input).is_leap?).to be(output)
      end
    end
  end
end