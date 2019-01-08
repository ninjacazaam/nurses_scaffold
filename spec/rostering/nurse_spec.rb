require 'spec_helper'
require 'rostering/nurse'

module Rostering
  describe Nurse do
    describe 'equality compare' do
      it 'is equal with the same uid' do
        expect(Nurse.new('1a', 'Frodo')).to eq(Nurse.new('1a', 'Frodo'))
      end

      it "doesn't compare names" do
        expect(Nurse.new('1a', 'Frodo')).to eq(Nurse.new('1a', 'Bilbo'))
      end

      it 'is not equal with different uids' do
        expect(Nurse.new('1a', 'Frodo')).not_to eq(Nurse.new('2b', 'Frodo'))
      end
    end
  end
end
