require 'spec_helper'
require 'rostering/io/nurses_file'

module Rostering
  describe IO::NursesFile do
    describe '.read' do
      it 'reads two nurses from a file' do
        expect(described_class.read(sample_data_filename('two_nurses.csv'))).to eq(
          [
            'Iskra',
            'Andronicus'
          ]
        )
      end
    end
  end
end
