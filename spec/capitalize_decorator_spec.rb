require_relative '../book'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../capitalize_decorator'
require_relative '../base_decorator'

describe CapitalizeDecorator do
  context 'When testing the correct_name method' do
    it 'should capitalize de Nameable name' do
      person = Person.new(25, 'leia', 'asfasfff')
      student = Student.new(25, 'chewbacca', 'asfas')
      teacher = Teacher.new(25, 'math', 'adfadf', 'obiwan')
      cap_person = CapitalizeDecorator.new(person)
      cap_student = CapitalizeDecorator.new(student)
      cap_teacher = CapitalizeDecorator.new(teacher)
      expect(cap_person.correct_name).to eq 'Leia'
      expect(cap_student.correct_name).to eq 'Chewbacca'
      expect(cap_teacher.correct_name).to eq 'Obiwan'
    end
  end
end
