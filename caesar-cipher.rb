# ask user to input message
puts "Please enter your message:"
message = gets.chomp # gets.chomp returns a string. That's what we want here.

shift_factor = nil # define the shift_factor

# loop until the shift factor is verified as an integer
until shift_factor.is_a?(Integer)
  puts "Please enter a shift factor:"
  input = gets.chomp
  begin
    # Attempt to convert the input to an Integer
    shift_factor = Integer(input)
  rescue ArgumentError
    # If conversion fails, print an error message and loop will continue
    puts "That's not a valid number. Please enter an integer."
  end
end

# ceaser cipher method that accepts message and shift factor as parameters and returns the encrypted string.
def caesar_cipher(message, shift_factor)
  
  # define local variables
  new_string = []
  wrap_amaount = 0
  new_char = ""
  shifted_ascii_value = 0

  # delete spaces off end of string and split string into an array of chars
  message_array = message.rstrip.chars
  puts "message_array = #{message_array}"

  # Shift each character in message
  message_array.map do |char|
    ascii_value = char.ord
    shifted_ascii_value = ascii_value - shift_factor
    wrap_amaount = 0

    if ascii_value.between?(97,122) #check if char is lower case
      if shifted_ascii_value < 97
        wrap_amaount = 97 - shifted_ascii_value
        new_char = (122 - wrap_amaount).chr
        puts ("new char #{char} was wrapped! It's now #{new_char}!")
      else
        new_char = shifted_ascii_value.chr
        puts ("new char #{char} wasn't wrapped! It's now #{new_char}!")
      end
    elsif ascii_value.between?(65,90) #check if char is upper case
      if shifted_ascii_value < 65
        wrap_amaount = 65 - shifted_ascii_value
        new_char = (90 - wrap_amaount).chr
        puts ("new char #{char} was wrapped! It's now #{new_char}!")
      else
        new_char = shifted_ascii_value.chr
        puts ("new char #{char} wasn't wrapped! It's now #{new_char}!")
      end
    else
      new_char = char
      puts ("special char #{char} was pushed to new_string!")
    end
    new_string.push(new_char)
  end
  new_string = new_string.join(" ")
  puts "#{new_string}"
end

caesar_cipher(message, shift_factor)
