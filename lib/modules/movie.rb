module Movie
  def name
    details.css('a').text.strip
  end

  def link
    "http://www.moviefone.com" + details.css('a').attribute('href').value
  end

  def showtimes
    values = []
    showtimes = self.css('a.gt').empty? ? self.css('span.stDisplay') : self.css('a.gt')
    showtimes.each do |time|
      values << time.text
    end
    values
  end

  private

  def details
    self.css('div.movietitle')
  end
end
