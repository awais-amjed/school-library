require './book'
require './student'
require './teacher'

class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books(show_index: false)
    index = 1
    puts 'We have no books yet ;-;' if @books.length.zero?
    @books.each do |book|
      puts "#{"#{index}) " if show_index}Title: \"#{book.title}\", Author: #{book.author}"
      index += 1
    end
  end

  def list_all_people(show_index: false)
    puts 'No one comes here ;-;' if @people.length.zero?
    index = 1
    @people.each do |person|
      puts "#{if show_index
                "#{index}) "
              end}[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_all_rentals(id)
    selected_person = @people.find { |person| person.id == id }
    return nil if selected_person.nil?

    puts 'This person has no rentals' if selected_person.rentals.length.zero?
    selected_person.rentals.each do |rental|
      puts "Date: \"#{rental.date}\", Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def create_student(name, age, parental_permission)
    @people << Student.new(age, 'No classroom', name, parent_permission: parental_permission)
  end

  def create_teacher(name, specialization, age)
    @people << Teacher.new(age, specialization, name)
  end

  def create_book(title, author)
    @books << Book.new(title, author)
  end

  def create_rental(book, person, date)
    @rentals << Rental.new(date, book, person)
  end
end
