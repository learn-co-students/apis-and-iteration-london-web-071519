#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

#Welcome message
welcome
#recieves input from the user
character = get_character_from_user
#calls the final method in the api_communicator.rb
show_character_movies(character)
