require 'mechanize'

module Zipcode
  def search
    agent = Mechanize.new
    page = agent.get("http://www.moviefone.com")
    search_form = page.form_with id: 'frm-search'
    search_form.fields[1].value = self
    agent.submit search_form
  end
end

