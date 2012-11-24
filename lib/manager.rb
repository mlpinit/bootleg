require_relative 'finder'
require_relative 'extractor'

class Manager

  class << self
    attr_accessor :zipcode
  end

  def initialize(zipcode)
    @zipcode = zipcode
    @pages ||= find_pages
    @all_theaters = []
    Manager.zipcode = zipcode
  end

  def find_pages
    Finder.new(@zipcode).hrefs
  end

  def extract_theaters
    @pages.each do |page|
      @all_theaters << Extractor.new(page, @zipcode).page_theaters
    end
    @all_theaters.flatten
  end
end
