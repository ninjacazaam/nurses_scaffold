require 'spec_helper'
require 'rostering/io/text_formatter'

module Rostering
  describe IO::TextFormatter do
    include DateSpecHelpers

    let(:io) { StringIO.new }
    let(:bilbo) { Nurse.new('Bilbo') }
    let(:frodo) { Nurse.new('Frodo') }
    let(:samwise) { Nurse.new('Samwise') }

    subject { IO::TextFormatter.new(io) }

    describe '#write_roster' do
      context 'with no day rosters' do
        let(:roster) { Roster.new }

        it 'writes nothing' do
          subject.write_roster(roster)
          expect(io.string).to eq('')
        end
      end

      context 'with a single day roster with two shifts' do
        let(:roster) do
          Roster.new([
                       DayRoster.new(
                         jan(10),
                         [ShiftRoster.new(:morning, [bilbo, frodo]), ShiftRoster.new(:afternoon, [samwise])]
                       )
                     ])
        end

        it 'writes the day, then the nurses for each shift' do
          subject.write_roster(roster)
          expect(io.string).to eq("2017-01-10\n  morning: Bilbo, Frodo\n  afternoon: Samwise\n")
        end
      end
    end
  end
end
