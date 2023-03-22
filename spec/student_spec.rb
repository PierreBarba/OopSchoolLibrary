require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new(25, 'Hermione Granger', 'nakjdfnkjsd')
  end

  context 'testing methods' do
    it 'should create a new object' do
      expect(@student).to be_instance_of(Student)
    end

    it '#play_hooky' do
      expect(@student.play_hooky).to eql('¯(ツ)/¯')
    end
  end
end
