def welcome
  # puts out a welcome message here!
  puts ""
  puts "|===================================|"
  puts "|  Welcome to the Star Wars Trivia! |"
  puts "|===================================|"
  puts ""
end

def get_character_from_user
  print "Please enter a character name: "
  # use gets to capture the user's input. This method should return that input, downcased.
  user_input = gets.chomp
  user_input
end
