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
  end
end
