require 'csv'

class Create
    def create_movies(html)
        movies = []
        doc = Nokogiri::HTML(html)
            doc.css(".card").each do |item|
            name = item.css('.card-content-title').map { |name| name.text.strip }
            genre = item.css('.video-country').map{ |genre| genre.text.strip }
            year = item.css('.video-year').map { |year| year.text.strip }
            movies.push(
                name: name.first,
                genre: genre.first,
                year: year.first
            )
        end
        return movies
    end
end