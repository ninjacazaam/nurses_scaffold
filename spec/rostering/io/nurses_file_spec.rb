require 'spec_helper'
require 'rostering/io/nurses_file'
require 'rostering/nurse'

module Rostering
  describe IO::NursesFile do
    describe '.read' do
      it 'reads two nurses from a file' do
        expect(described_class.read(sample_data_filename('two_nurses.csv'))).to eq(
          [
            Nurse.new('OUGKCHWH', 'Gannon'),
            Nurse.new('IOCGKCOZ', 'Galya')
          ]
        )
      end
    end
  end
end
