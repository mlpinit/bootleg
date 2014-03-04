require 'spec_helper'
require 'bootleg/theater'

describe Bootleg::Theater do

  it 'raises KeyError if not initialized with a nokogiri-theater' do
    expect{described_class.new(not_theater: 'not theater')}.
      to raise_error(KeyError, 'key not found: :theater')
  end

  let(:nokogiri_theater) { double 'Nokogiri Theater' }
  let(:theater) { double('Theater', text: 'Royal', attributes: { 'href' => href }) }
  let(:href) { double( 'Href', value: 'http://moviefone.com') }
  let(:address) { double('Address', text: "\n\n\t Rockville, MD | 234-222") }
  let(:prices) { double('Prices', text: 'RegularPrice:$11.50 | ChildPrice:$6.50') }

  subject { described_class.new(theater: nokogiri_theater) }

  it 'has a title' do
    allow(nokogiri_theater).to receive_message_chain(:search, :last).
      and_return(theater)
    expect(subject.title).to eq('Royal')
  end

  it 'has a link' do
    allow(nokogiri_theater).to receive_message_chain(:search, :last).
      and_return(theater)
    expect(subject.link).to eq('http://moviefone.com')
  end

  it 'has an address' do
    allow(nokogiri_theater).to receive(:search).with('p.address').
      and_return(address)
    expect(subject.address).to eq("Rockville, MD")
  end

  context 'has price' do
    before do
      allow(nokogiri_theater).to receive_message_chain(:search, :first).
        and_return(prices)
    end

    it 'for adult' do
      expect(subject.adult_price).to eq('$11.50')
    end

    it 'for child' do
      expect(subject.child_price).to eq('$6.50')
    end
  end

end
