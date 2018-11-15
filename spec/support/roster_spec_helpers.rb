require 'rostering/day_roster'
require 'rostering/shift'

module RosterSpecHelpers
  def day_roster_to_hash(day_roster)
    result = {}
    day_roster.each_shift do |shift_roster|
      result[shift_roster.shift_name] = shift_roster.staff_names
    end
    result
  end

  def roster_to_hash(roster)
    result = {}
    roster.each_day do |date, day_roster|
      result[date] = day_roster_to_hash(day_roster)
    end
    result
  end

  RSpec::Matchers.define :match_roster do |expected|
    match do |actual|
      expect(actual).to be_a(Rostering::Roster)
      expect(roster_to_hash(actual)).to eq(expected)
    end

    failure_message do |actual|
      "expected that #{stringify_keys(roster_to_hash(actual))} would equal the expected"
    end

    def stringify_keys(hash)
      result = {}
      hash.each do |key, value|
        result[key.to_s] = value
      end
      result
    end
  end

  RSpec::Matchers.define :match_day_roster do |expected|
    match do |actual|
      expect(actual).to be_a(Rostering::DayRoster)
      expect(day_roster_to_hash(actual)).to eq(expected)
    end

    failure_message do |actual|
      "expected that #{day_roster_to_hash(actual)} would be equal #{expected}"
    end
  end

  def day_containing(staff, shift_name = 'main')
    result = Rostering::DayRoster.new
    result.fill_next_shift(Rostering::Shift.new(shift_name, Date.new(2017,1,1)), [staff])
    result
  end
end
