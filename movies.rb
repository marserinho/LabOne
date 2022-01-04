require 'nokogiri'
require 'json'
require 'csv'
require 'open-uri'
require_relative 'save_to_csv.rb'
require_relative 'save_to_json.rb'
require_relative 'create_movies.rb'

class Movies
    url = 'https://megogo.net/ua/films/main'
    html = open(url)
    create = Create.new
    movies = create.create_movies(html)
    saveCSV = SaveCSV.new
    saveCSV.saveToCSV(File.join(File.dirname(__FILE__), "movies.csv"), movies)
    saveJson = SaveJson.new
    saveJson.saveToJson(File.join(File.dirname(__FILE__), "movies.json"), movies)
end