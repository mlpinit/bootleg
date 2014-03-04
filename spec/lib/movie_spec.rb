require 'spec_helper'
require 'bootleg/movie'

describe Bootleg::Movie do

  it 'raises KeyError if not initialized with a nokogiri-movie' do
    expect{described_class.new(not_movie: 'not movie')}.
      to raise_error(KeyError, 'key not found: :movie')
  end

  let(:attributes) {}
  let(:nokogiri_movie) { double 'Nokogiri Movie' }
  let(:href) { double( 'Href', value: 'http://moviefone.com') }
  let(:movie) { double('Movie', text: 'Matrix', attributes: { 'href' => href }) }
  let(:times) { [ double(text: '1am'), double(text: '2pm')] }

  subject { described_class.new(movie: nokogiri_movie) }

  it 'has a title' do
    allow(nokogiri_movie).to receive_message_chain(:search, :last).
      and_return(movie)
    expect(subject.title).to eq('Matrix')
  end

  it 'has a link' do
    allow(nokogiri_movie).to receive_message_chain(:search, :last).
      and_return(movie)
    expect(subject.link).to eq('http://moviefone.com')
  end

  it 'has showtimes' do
    allow(nokogiri_movie).to receive(:search).with('span.stDisplay').
      and_return(times)
    expect(subject.showtimes).to include('1am', '2pm')
  end

end
