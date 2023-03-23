require_relative '../nameable'

RSpec.describe Nameable do
    describe '#correct_name' do
      it 'raises NotImplementedError' do
        expect { subject.correct_name }.to raise_error NotImplementedError, 'you need to implement the correct_name method by inheritance'
      end
    end
  end
  