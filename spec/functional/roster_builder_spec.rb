require 'spec_helper'
require 'roster_builder'
require 'nurse'

describe RosterBuilder do
  include DateSpecHelpers

  def build_with(date_range, nurses, config = {})
    default_config = {
      nurses_per_shift: 5,
      shift_names: %w[morning evening night],
    }
    RosterBuilder.new(default_config.merge(config)).build(date_range, nurses)
  end

  describe '#build' do
    it 'builds a single day roster' do
      nurses = Nurse.build_array %w[Andy Betty Charles]
      date_range = jan(1)..jan(1)

      result = build_with(date_range, nurses, nurses_per_shift: 1)

      expect(result.to_h).to eq(
        jan(1) => {
          'morning' => ['Andy'],
          'evening' => ['Betty'],
          'night' => ['Charles']
        }
      )
    end
  end
end