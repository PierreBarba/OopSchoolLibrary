require_relative '../book'

describe Book do
  book = Book.new('Perfume The Story of a Murderer', 'Patrick Süskind')
  context 'When testing the Book_class' do
    it 'create an instance of the book class object with a title and author' do
      book = Book.new('Perfume The Story of a Murderer', 'Patrick Süskind')
      expect(book).to be_instance_of(Book)
      expect(book.title).to eq 'Perfume The Story of a Murderer'
      expect(book.author).to eq 'Patrick Süskind'
    end

    context 'When testing the add_rental method' do
      it 'there must be a rental object added to the @rental attribute' do
        person = Person.new(18)
        book = Book.new('Perfume The Story of a Murderer', 'Patrick Süskind')
        rental = Rental.new('2022-02-02', book, person)
        book.add_rental(rental)
        expect(book.rentals.length).to eq 1
      end
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the person data' do
      expected_json = '{"title":"Perfume The Story of a Murderer","author":"Patrick Süskind"}'
      book_to_json = book.to_json
      expect(book_to_json).to eq(expected_json)
    end
  end
end
