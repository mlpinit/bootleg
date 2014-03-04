module Bootleg
  class Movie

    attr_reader :movie
    private :movie

    def initialize(args)
      @movie ||= args.fetch(:movie)
    end

    def title
      movie_info.text
    end

    def link
      movie_info.attributes['href'].value
    end

    def showtimes
      movie.search('span.stDisplay').map { |times| times.text }
    end

    private

    def movie_info
      @movie_info ||= movie.search('div.movietitle a').last
    end

  end
end
