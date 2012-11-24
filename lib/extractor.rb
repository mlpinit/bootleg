require 'mechanize'
require 'nokogiri'
require 'open-uri'
require_relative 'finder'
require_relative 'modules/theater'

class Extractor

  attr_reader :page_theaters

  def initialize(page, zipcode)
    @page = (Nokogiri::HTML(open(page)))
    @page_theaters = []
    extract_movies
    @zipcode ||= zipcode
  end
  
  def extract_movies
    theaters.each do |theater|
      theater.extend Theater
      BootlegTheater.create!(name: theater.name, href: theater.link)
      theater_info = { name: theater.name, href: theater.link, movies: theater.movies}
      @page_theaters << theater_info
    end
  end

  private

  def theaters
    @page.css('div.theater')
  end
end
