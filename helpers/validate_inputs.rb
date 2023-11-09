def validate_inputs
  validated_inputs = {}

  validated_inputs[:age] = validate_age_input
  validated_inputs[:name] = validate_name_input

  validated_inputs
end

def validate_age_input
  age = nil

  while age.nil? || age < 1
    print 'Age: '
    input = gets.chomp

    # * This is a rescue block, it will rescue the code from breaking if an error occurs
    # * due to the input not being a number. In this case, it will rescue the error
    # * and will return nil instead.
    age = begin
      Integer(input)
    rescue StandardError
      nil # * ask again for the age.
    end
    puts 'Age must be a number or > 1' if age.nil? || age < 1
  end

  age
end

def validate_name_input
  name = nil

  while name.nil? || name.empty? || name.to_i.to_s == name
    print 'Name: '
    name = gets.chomp
    puts 'Name must be a string' if name.nil? || name.empty? || name.to_i.to_s == name
    # * LAST CONDITION: >>name.to_i.to_s == name<< checks if converting name to an integer
    # * and then back to a string results in the original string.
    # * This is a way to check if the input is a valid integer. If name is a number,
    # * converting it to an integer and back to a string should not change the value.
    # * if it does, then the input is not a valid String.
  end

  name
end
