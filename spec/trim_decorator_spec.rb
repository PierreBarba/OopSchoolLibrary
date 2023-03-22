require_relative '../trim_decorator'
require_relative '../person'

describe '#correct_name' do
  person = Person.new(25, 'LordVoldemortLongName', 'adfa')
  correct_size = TrimmerDecorator.new(person)
  it 'should retur the correct size' do
    expect(correct_size.correct_name).to eql('LordVoldem')
  end
end
