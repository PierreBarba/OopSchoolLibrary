require_relative '../classroom'

describe Classroom do
  context 'When testing Classroom class' do
    it 'The described action consists of creating a classroom object with a label and an empty array of students.' do
      classroom = Classroom.new('History')
      expect(classroom).to be_instance_of(Classroom)
      expect(classroom.label).to eq 'History'
      expect(classroom.students).to eq []
    end
  end

  context 'When testing the add_student method' do
    it 'the attribute must @student must have a student added' do
      classroom = Classroom.new('History')
      student = Student.new(25, 'lucas', 'asfas')
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end
