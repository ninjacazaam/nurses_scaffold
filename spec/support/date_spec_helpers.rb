require 'date'
require 'month'

module DateSpecHelpers
  TEST_YEAR = 2017

  def jan(day = nil)
    test_date 1, day
  end

  def feb(day = nil)
    test_date 2, day
  end

  def test_date(month, day = nil)
    if day
      Date.new(TEST_YEAR, month, day)
    else
      Month.new(TEST_YEAR, month)
    end
  end
end
