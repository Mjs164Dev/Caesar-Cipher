puts "Please enter your message:"
message = gets.chomp

shift_factor = nil

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

def caesar_cipher(message, shift_factor)
  sum = 5 + shift_factor
  puts sum
end

caesar_cipher(message, shift_factor)