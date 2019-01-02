require 'spec_helper'
require 'rostering/nurse'

module Rostering
  describe Nurse do
    describe 'equality compare' do
      it 'is equal with the same name' do
        expect(Nurse.new('Frodo')).to eq(Nurse.new('Frodo'))
      end

      it 'is not equal with different names' do
        expect(Nurse.new('Frodo')).not_to eq(Nurse.new('Bilbo'))
      end
    end
  end
end
