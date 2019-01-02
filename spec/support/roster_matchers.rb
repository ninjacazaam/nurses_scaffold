require 'rostering/io/text_formatter'

def day_roster_to_hash(day_roster)
  day_roster.shift_rosters.inject({}) do |accumulator, shift_roster|
    accumulator[shift_roster.name] = shift_roster.nurses.map(&:name)
    accumulator
  end
end

def roster_to_hash(roster)
  roster.day_rosters.inject({}) do |accumulator, day_roster|
    accumulator[day_roster.date] = day_roster_to_hash(day_roster)
    accumulator
  end
end

def stringify_date_keys(hash)
  return hash unless hash.is_a?(Hash)

  hash.map do |key, value|
    key_string = key.is_a?(Date) ? key.iso8601 : key
    [key_string, value]
  end.to_h
end

RSpec::Matchers.define :match_roster do |expected|
  match do |actual|
    expect(actual).not_to be_nil
    expect(roster_to_hash(actual)).to eq(expected)
  end

  failure_message do |actual|
    actual_text = stringify_date_keys(roster_to_hash(actual))
    expected_text = stringify_date_keys(expected)

    "expected that #{actual_text} would equal #{expected_text}"
  end
end
