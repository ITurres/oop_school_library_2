require_relative 'dependencies'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # * =================================================== list_all_books
  # * ======
  # * 'with_index' when >true< will print the index to be later used in the
  # * 'create_book_rental' method which invokes it with >true<.
  # * This is because the user will select a book by its index.
  # * default to >false< to just list elements, without index.
  def list_all_books(with_index: false)
    @books.each_with_index do |book, index|
      puts "#{with_index ? "#{index})" : ''} Title: #{book.title}, Author: #{book.author}."
    end
    puts
  end

  # * =================================================== list_all_people
  # * ======
  # * 'with_index' when >true< will print the index to be later used in the
  # * 'create_book_rental' method which invokes it with >true<.
  # * This is because the user will select a person by its index.
  # * default to >false< to just list elements, without index.
  def list_all_people(with_index: false)
    @people.each_with_index do |person, index|
      person_type = person.class.name

      case person_type
      when 'Student'
        puts "#{with_index ? "#{index})" : ''}[Student] Name: #{person.name}, " \
             "ID: #{person.id}, Age: #{person.age}"
      when 'Teacher'
        puts "#{with_index ? "#{index})" : ''}[Teacher] Name: #{person.name}, " \
             "ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  # * =================================================== create_teacher_or_student
  def create_teacher_or_student
    puts 'Do you want to create a (1) student or (2) teacher? [Input the number]:'

    input = gets.chomp.to_i

    validated_inputs = validate_inputs
    age = validated_inputs[:age]
    name = validated_inputs[:name]

    if input == 1
      print 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp.downcase == 'y'

      student = Student.new(age, name, parent_permission)
      @people << student

      puts "Student #{student.name} successfully created!!"
    elsif input == 2
      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age, specialization, name)
      @people << teacher

      puts "Teacher #{teacher.name} successfully created!!"
    else
      puts 'Invalid option, please try again.'
    end
  end

  # * =================================================== create_book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts "Book #{book.title} successfully created!!"
  end

  # * =================================================== create_book_rental
  def create_book_rental
    puts 'Select a book from the following list by number'
    list_all_books(with_index: true)

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person from the following list by number (not id)'
    list_all_people(with_index: true)

    person_index = gets.chomp.to_i
    person = @people[person_index]

    date = ''
    while date !~ /(?<YYYY>\d{4})-(?<MM>\d{2})-(?<DD>\d{2})/
      print 'Enter a date in YYYY-MM-DD format: '
      date = gets.chomp
    end

    rental = Rental.new(date, book, person)
    @rentals << rental

    puts 'Rental created successfully!!'
  end

  # * =================================================== list_all_rentals
  def list_all_rentals
    print 'Enter person id: '
    person_id = gets.chomp.to_i

    @rentals.each do |rental|
      person = rental.person

      next unless person.is_a?(Student) || person.is_a?(Teacher)

      puts 'Rentals: '

      if person.id == person_id
        puts rental.rental_to_s
      else
        puts "Person with ID #{person_id} not found."
      end
    end
    puts
  end

  # * =================================================== exit_program
  def exit_program
    puts 'Thanks for using School Library App!'
    exit(0)
  end
end
