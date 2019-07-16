require 'rest-client'
require 'json'
require 'pry'


#takes a character name and returns an array of the movies the character appears in.
def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  all_characters = response_hash["results"]
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  all_characters.each{ |character|
    if character["name"] == character_name
       return character["films"]
       #Throw an helpful error if the user input is incorrect
    else
      return "NO RESULT"
    end
    }
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

#takes in movie links and returns titles
def get_movie_titles(movie_links)
  output = {}
  movie_links.each{|movie_link|
    response_title_raw = RestClient.get(movie_link)
    response_title_hash = JSON.parse(response_title_raw)
    output["#{response_title_hash["release_date"]}"] = "#{response_title_hash["title"]}"
  }
  #sorting hash by keys (date)
  output.sort
#get_character_movies_from_api("Nick Charlet")["results"][0]["films"]
end

# prints the movie titles.
def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each{|date, title|
  puts "#{date}  :  #{title}"
}
end

# bringing it all together.
def show_character_movies(character)
  movies = get_character_movies_from_api(character)
  #friendly error response
    if movies == "NO RESULT"
      puts ""
      puts "Character not found. Please check the name and try again."
      puts "(e.g. Luke Skywalker)"
      puts ""
      return 
    end
  titles = get_movie_titles(movies)
  puts ""
  print_movies(titles)
  puts ""
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
#puts "Type a name"
#user_input = gets.chomp
#show_character_movies(user_input)


