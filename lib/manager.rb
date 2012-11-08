require_relative 'finder'
require_relative 'extractor'

class Manager
  def initialize(zipcode)
    @zipcode = zipcode
    @pages ||= find_pages
    @all_theaters = []
  end

  def find_pages
    Finder.new(@zipcode).hrefs
  end

  def extract_theaters
    @pages.each do |page|
      @all_theaters << Extractor.new(page).page_theaters
    end
    @all_theaters.flatten
  end
end
