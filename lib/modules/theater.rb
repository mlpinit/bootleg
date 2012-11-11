require_relative 'movie'

module Theater
  def name
    details.text.strip
  end

  def link
    details.attribute('href').value
  end

  def movies
    movies = self.css('div.movie-listing.first')
    values = []
    movies.each do |movie|
      movie.extend Movie
      movie_info = { name: movie.name, href: movie.link, showtimes: movie.showtimes }
      values << movie_info
    end
    values
  end

  private
  def details
    self.css('h3.title').css('a')
  end
end
