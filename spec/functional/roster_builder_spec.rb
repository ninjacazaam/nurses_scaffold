require 'spec_helper'
require 'roster_builder'
require 'staff'

describe RosterBuilder do
  include DateSpecHelpers
  include RosterSpecHelpers

  def build_with(date_range, staff, config = {})
    default_config = {
      staff_per_shift: 5,
      shift_names: %w[morning evening night],
    }
    RosterBuilder.new(default_config.merge(config)).build(date_range, staff)
  end

  describe '#build' do
    it 'builds a single day roster' do
      staff = Staff.build_array %w[Andy Betty Charles]
      date_range = jan(1)..jan(1)

      result = build_with(date_range, staff, staff_per_shift: 1)

      expect(result).to match_roster(
        jan(1) => {
          'morning' => ['Andy'],
          'evening' => ['Betty'],
          'night' => ['Charles']
        }
      )
    end
  end
end