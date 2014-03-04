module Bootleg
  class Theater

    attr_reader :theater
    private :theater

    def initialize(args)
      @theater ||= args.fetch(:theater)
    end

    def title
      title_info.text
    end

    def link
      title_info.attributes['href'].value
    end

    def address
      # removes the phone number at the end of the address and the white space
      theater.search('p.address').text.sub(/\|.*/,'').strip
    end

    def adult_price
      prices.first
    end

    def child_price
      prices.last
    end

    def movies
      theater.search('div.movie-data-wrap').
        map { |movie| Bootleg::Movie.new(movie: movie) }
    end

    private

    def title_info
      @title_link ||= theater.search('div.title a').last
    end

    def prices
     @prices ||= theater.
        search("div.prices").
        first.
        text.
        gsub(/\s/,'').
        split('|').
        map { |price| $& if price.match /\$.*\d{2}/ }
    end

  end
end
