require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'modules'

class App
  def initialize
    @books = []
    @users = []
    @rentals = []
    load_data
  end

  include ExtraMethods

  def books_list
    list = ''
    @books.each_with_index { |book, i| list << "\n[#{i + 1}]. Title: #{book.title}, Author: #{book.author}" }
    list << "\n"
  end

  def users_list
    list = ''
    @users.each_with_index do |user, i|
      list << "\n[#{i + 1}]. id:#{user.id} class:#{user.class}  name: #{user.name}, age: #{user.age}"
    end
    list << "\n\n"
  end

  def rentals_list
    list = ''
    @rentals.each_with_index do |rental, i|
      list << "\n[#{i + 1}]. date:#{rental.date} book:#{rental.book.title} owner: #{rental.person.name}"
    end
    list << "\n\n"
  end

  def load_data
    load_books
    load_users
    load_rentals
  end

  def start
    loop do
      option = selected_menu_option
      case option
      when 1
        puts books_list
      when 2
        puts users_list
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        puts user_rentals
      else
        break
      end
      wait_user
    end
  end

  def create_book
    puts "\nEnter the book data:"
    print 'Enter Title: '
    title = gets.chomp
    print 'Enter Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "\nBook created successfully.\n"
  end

  def create_person
    puts "\n if you want to create a student press (1) or if you want to create a teacher press (2): "
    option = get_option_selected(1, 2)

    case option
    when 1
      attach_student
    when 2
      attach_teacher
    end
  end

  def create_rental
    puts "\nselect a book from the following list, by number:"
    puts books_list
    book_number = get_option_selected(1, @books.length)
    selected_book = @books[book_number - 1]
    puts "\nselect a person from the following list, by number:"
    puts users_list
    user_number = get_option_selected(1, @users.length)
    selected_user = @users[user_number - 1]
    puts "\nEnter the date of this rental:"
    date = gets.chomp
    rental = Rental.new(date, selected_book, selected_user)
    @rentals.push(rental) unless rental.nil?
    puts "\nrental created successfully.\n"
  end

  def user_rentals
    print 'Input user id: '
    id = gets.chomp
    person = @users.find { |per| per.id == id }
    person.nil? ? "no valid id\n" : person.rental_list
  end

  def get_option_selected(first, last)
    option = ''
    loop do
      option = gets.chomp.to_i
      break if option >= first && option <= last

      print 'select a valid option '
    end
    option
  end

  def permission?
    print 'has parent permission? [Y/N]'
    answer = gets.chomp.capitalize
    return true unless answer == 'n'

    false
  end

  def attach_student
    puts "\nEnter the student data:"
    print 'Enter student name: '
    name = gets.chomp
    print 'Enter student age: '
    age = gets.chomp.to_i
    permiso = age >= 18 ? true : permission?
    person = Student.new(age, name, parent_permission: permiso)
    @users.push(person)
    puts "\nstudent created successfully.\n"
  end

  def attach_teacher
    puts "\nEnter the teacher data:"
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @users.push(person)
    puts "\nteacher created successfully.\n"
  end
end
