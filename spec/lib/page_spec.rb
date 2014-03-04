require 'spec_helper'
require 'bootleg/page'

describe Bootleg::Page do

  it 'raises KeyError if not initialized with a nokogiri-page' do
    expect{described_class.new(not_page: 'not page')}.
      to raise_error(KeyError, 'key not found: :page')
  end

  let(:link) { double 'Link' }
  let(:nokogiri_page) { double 'Nokogiri Page' }
  subject { described_class.new(page: nokogiri_page) }

  it 'returns "Last Page" if no more pages' do
    allow(nokogiri_page).to receive(:link_with).
      with(class: 'next-showtime').and_return(nil)
    expect(subject.next).to eq('Last Page')
  end

end
