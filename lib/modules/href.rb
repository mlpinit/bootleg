module Href
  def all
    pages = []
    count.times { |nr| pages << url + nr.to_s }
    pages
  end

  private

  def count
    self.links.select { |link| link.text.size < 3 and link.text =~ /\d/ }.last.text.to_i
  end

  def url
    self.uri.to_s + '?page='
  end
end

