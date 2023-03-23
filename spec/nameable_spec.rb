require_relative '../nameable'

RSpec.describe Nameable do
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect do
        subject.correct_name
      end.to raise_error NotImplementedError,
                         'you need to implement the correct_name method by inheritance'
    end
  end
end
