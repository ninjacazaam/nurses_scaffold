class RosterBuilder
  DEFAULT_CONFIG = {
    staff_per_shift: 5,
    shift_names: %w[morning evening night],
  }.freeze

  def initialize(config = DEFAULT_CONFIG)
    @config = config
  end

  def build(date_range, all_staff)
  end
end
