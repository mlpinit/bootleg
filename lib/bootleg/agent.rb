module Bootleg
  class Agent

    attr_reader :zipcode

    def initialize(args)
      @zipcode = args.fetch(:zipcode)
    end

    def page
      @page ||= Bootleg::Page.new page: mechanize.submit(search_form)
    end

    private

    def mechanize
      Mechanize.new
    end

    def home_page
      mechanize.get('http://moviefone.com')
    end

    def search_form
      home_page.form_with(id: 'frm-search').tap do |form|
        form.fields.last.value = zipcode
      end
    end

  end
end
