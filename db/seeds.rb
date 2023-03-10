# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'json'

i=1

20.times do
url = "https://api.themoviedb.org/3/trending/movie/week?api_key=#{ENV['TMDB_KEY']}&page=#{i}"
jsonInfo = JSON.parse(URI.open(url).read)['results']
  jsonInfo.each do |movie|
    Movie.create(title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w300#{movie["poster_path"]}", rating: movie["vote_average"].round(1))
  end
i+=1
end
