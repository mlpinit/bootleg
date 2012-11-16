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
    theater = BootlegTheater.last
    movies.each do |movie|
      movie.extend Movie
      movie_info = { name: movie.name, href: movie.link, showtimes: movie.showtimes }
      values << movie_info
      insert_movies(theater,movie)
    end
    values
  end

  private
  def details
    self.css('h3.title').css('a')
  end

  def insert_movies(theater, movie)
    existing_movie = BootlegMovie.where(name: movie.name).first
    if existing_movie
      showtime = theater.bootleg_showtimes.new
      showtime.bootleg_movie_id = existing_movie.id
      showtime.save
    else
      theater.movies.create!(name: movie.name, href: movie.link)
    end
    showtime = BootlegShowtime.last
    showtime.showtimes = movie.showtimes.to_s.gsub(/-/, '').gsub(/\n/,'').strip
    showtime.save
  end
end
