require 'rostering/roster'

module Rostering
  # Initialize with a certain set of configuration options and then use
  # this to build rosters for specific time periods.
  class RosterBuilder
    DEFAULT_CONFIG = {
      nurses_per_shift: 5,
      shift_names: %w[morning evening night],
    }.freeze

    def initialize(config = DEFAULT_CONFIG)
      @config = config
    end

    def build(date_range, all_nurses)
      daily_required_nurse_count = @config[:shift_names].count * @config[:nurses_per_shift]
      raise "Not enough Nurses for your shifts" if all_nurses.count < daily_required_nurse_count
      roster_dates = {}
      date_range.each do |date|
        nurses_for_today = all_nurses.map(&:clone)
        shifts = {}
        @config[:shift_names].each do |shift|
          shifts[shift.to_sym] = nurses_for_today.shift(@config[:nurses_per_shift])
        end
          roster_dates[date] = shifts
      end
      Roster.new(roster_dates)
    end
  end
end
