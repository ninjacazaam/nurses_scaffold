require 'spec_helper'
require 'rostering/roster_builder'

module Rostering
  describe RosterBuilder do
    include DateSpecHelpers

    describe '#build' do
      it 'Builds a Roster with the attributes passed' do
        date_range = Date.new(2020, 1, 17)..Date.new(2020, 1, 17)
        nurses = %w(Iskra
          Andronicus
          Tipene
          Jaroslav
          Damjana
          Onfroi
          Mari
          Tipporah
          Aurica
          Yu-Mi
          Maja
          Suzette
          Ziyaeddin
          Hoggraer
          Angharad)
        builder = Rostering::RosterBuilder.new
        roster = builder.build(date_range, nurses)
        expect(roster.dates.count).to eq 1
        expect(roster.dates.values.first.keys).to eq [:morning, :evening, :night]
      end
    end
  end
end
