module ExtraMethods
  def save_data
    File.exist?('data/books.json') ? File.open('data/books.json', 'w') : File.new('data/books.json', 'w')
    File.write('data/books.json', @books.to_json)

    File.exist?('data/rentals.json') ? File.open('data/rentals.json', 'w') : File.new('data/rentals.json', 'w')
    File.write('data/rentals.json', @rentals.to_json)

    File.exist?('data/users.json') ? File.open('data/users.json', 'w') : File.new('data/users.json', 'w')
    File.write('data/users.json', @users.to_json)
  end

  def load_books()
    return unless File.exist?('data/books.json') && File.size?('data/books.json')

    JSON.parse(File.read('data/books.json')).each { |book| @books.push(Book.new(book['title'], book['author'])) }
  end

  def load_users
    return unless File.exist?('data/users.json') && File.size?('data/users.json')

    JSON.parse(File.read('data/users.json')).each do |person|
      if person['class'] == 'Student'
        @users.push(Student.new(person['age'], person['name'], person['id'],
                                parent_permission: person['parent_permission']))
      else
        @users.push(Teacher.new(person['age'], person['specialization'], person['name'], person['id'],
                                parent_permission: person['parent_permission']))
      end
    end
  end

  def load_rentals
    return unless File.exist?('data/rentals.json') && File.size?('data/rentals.json')

    JSON.parse(File.read('data/rentals.json')).each do |rental|
      rent_person = @users.find { |person| person.id == rental['person_id'] }
      rent_book = @books.find { |book| book.title == rental['book_title'] }
      @rentals.push(Rental.new(rental['date'], rent_book, rent_person))
    end
  end
end
