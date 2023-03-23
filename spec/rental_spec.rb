require_relative '../person'
require_relative '../rental'
require_relative '../book'

describe Rental do
  person = Person.new(21, 'Natasha Romanoff', 'sdfsfds')
  book = Book.new('Don Quijote de la Mancha', 'Miguel de Cervantes')
  rental = Rental.new('2021/01/01', book, person)

  context 'When testing Rental Class' do
    it 'should create a Rental' do
      expect(rental).to be_instance_of(Rental)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the rental data' do
      expected_json = { date: rental.date, person_id: rental.person.id, book_title: rental.book.title }.to_json
      expect(rental.to_json).to eq(expected_json)
    end
  end
end
