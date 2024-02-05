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
  message_array = message.rstrip.chars # delete spaces off end of string and split string into an array of chars
  new_string = []
  message_array.map do |char|
    ascii_value = char.ord
    new_char = (ascii_value - shift_factor).chr
    new_string.push(new_char)
  end
  puts "**NEW STRING**"
  puts "#{new_string}"
end

caesar_cipher(message, shift_factor)