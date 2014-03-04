module Bootleg
  class Page

    attr_reader :page

    def initialize(args)
      @page ||= args.fetch(:page)
    end

    def next
      link ? self.class.new(page: link.click) : 'Last Page'
    end

    def theaters
      page.search('div.theater').
        map { |theater| Bootleg::Theater.new(theater: theater) }
    end

    private

    def link
      @link ||= page.link_with(class: 'next-showtime')
    end

  end
end
