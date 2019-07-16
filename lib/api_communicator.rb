require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  movies = []
  response_hash["results"].each do |key|
      if key["name"] == character_name
        movies << key["films"]
    end
  end
  movies
movie_info = []
  movies[0].each do |film|
    film_link = RestClient.get(film)
    film_hash = JSON.parse(film_link)
    movie_info << film_hash
  end
  movie_info
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films_list)
  films_list.each do |films|
    p films["title"]
    # binding.pry
  end
  # some iteration magic and puts out the movies in a nice list

end
# movies = get_character_movies_from_api("Luke Skywalker")
# print_movies(movies)
def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
