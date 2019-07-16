require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('https://swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  movies = []
  movie_info = []

  response_hash["results"].each do |key|
    if key["name"] == character_name
      movies = key["films"]
    end
  end

  movies.each_index do |each_link|
    movie_info << JSON.parse(RestClient.get(movies[each_link]))
    # response_string2 = RestClient.get(movies[each_link])
    # response_hash2 = JSON.parse(response_string2)
    # binding.pry
  end
movie_info
end

get_character_movies_from_api("Luke Skywalker")
binding.pry

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
