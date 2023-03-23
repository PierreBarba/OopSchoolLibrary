require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Person do
  person = Person.new(22, 'Tony Stark', 'jadfjnds')
  person_minor = Person.new(16, 'Bruce Banner', 'sndfnsodf')
  book = Book.new('Game of thrones', 'G. Martin')
  rental = Rental.new('2021/01/01', book, person)

  context 'When testing Person Class' do
    it 'should create a Person object' do
      expect(person).to be_instance_of(Person)
      expect(person.name).to eq 'Tony Stark'
      expect(person.age).to eq 22
    end
  end

  context 'When testing can_use_service method' do
    it 'must be true if age is greater than 18 or has parent permission' do
      expect(person.can_use_services?).to be true
    end
  end

  context 'When testing can_use_service method' do
    it 'should return true if age is greater than 18 or has parental permission' do
      expect(person.can_use_services?).to be true
      expect(person_minor.can_use_services?).to be true
    end
  end

  context 'When testing correct_name method' do
    it 'should return the correct name of the person' do
      expect(person.correct_name).to eq 'Tony Stark'
      expect(person_minor.correct_name).to eq 'Bruce Banner'
    end
  end

  context 'When testing add_rental method' do
    it 'should return array of rentals' do
      person.add_rental(rental)
      expect(person.rentals).to eq [rental]
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the person data' do
      expected_json = '{"class":"Person","id":"jadfjnds","name":"Tony Stark","age":22,"parent_permission":true}'
      person_to_json = person.to_json
      expect(person_to_json).to eq(expected_json)
    end
  end
end
