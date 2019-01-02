require 'rostering/shift_roster'

module Rostering
  class DayRoster
    attr_reader :shift_rosters, :date

    def initialize(date)
      @date = date
      @shift_rosters = [ShiftRoster.new(:someshift)]
    end
  end
end
