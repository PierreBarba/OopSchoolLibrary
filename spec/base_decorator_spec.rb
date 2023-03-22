require_relative '../base_decorator'describe BaseDecorator do
  context 'When testing BaseDecorator Class' do
    it 'should create a BaseDecorator object' do
      decorator_base = BaseDecorator.new('yoda')
      expect(decorator_base).to be_instance_of(BaseDecorator)
      expect(decorator_base.nameable).to eq 'yoda'
    end
  end  context 'When testing correct_name method' do
    it 'should create a DecoratorBase object' do
      decorator_base = BaseDecorator.new('Luke skywalker')
      expect(decorator_base).to be_instance_of(BaseDecorator)
      expect(decorator_base.nameable).to eq 'Luke skywalker'
    end
  end  let(:mock_nameable) { double('nameable') }
  subject(:decorator_base) { described_class.new(mock_nameable) }
  context 'when the nameable object returns a correct name' do
    it 'returns the correct name' do
      allow(mock_nameable).to receive(:correct_name).and_return('Han Solo')
      expect(decorator_base.correct_name).to eq('Han Solo')
    end
  end
end