require 'spec_helper'
require 'rostering/io/text_formatter'

module Rostering
  describe IO::TextFormatter do
    include DateSpecHelpers

    let(:io) { StringIO.new }
    let(:bilbo) { Nurse.new('Bilbo') }
    let(:frodo) { Nurse.new('Frodo') }
    let(:samwise) { Nurse.new('Samwise') }
    let(:roster) { double('roster') }

    subject { IO::TextFormatter.new(io) }

    describe '#write_roster' do
      context 'with no day rosters' do
        it 'writes nothing' do
          allow(roster).to receive(:each_shift)

          subject.write_roster(roster)
          expect(io.string).to eq('')
        end
      end

      context 'with a single shift' do
        it 'writes the day, then the nurses for each shift' do
          allow(roster).to receive(:each_shift).and_yield(jan(10), 'morning', [bilbo, frodo])

          subject.write_roster(roster)
          expect(io.string).to eq("2017-01-10 | morning | Bilbo, Frodo\n")
        end
      end
    end
  end
end
