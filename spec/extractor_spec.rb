require 'spec_helper'

describe Extractor do
  it "should raise an error withouth arguments" do
    expect{ Extractor.new }.to raise_error(ArgumentError)
  end

  it "should not raise error with one argument" do
    expect { Extractor.new("http://www.moviefone.com")}.to_not raise_error(ArgumentError)
  end

  it "should raise an error with more then one argument" do
    expect { Extractor.new("arg1", "arg2") }.to raise_error(ArgumentError)
  end

  before :all do 
    @theaters = Extractor.new("http://www.moviefone.com/showtimes/manchester-md/21102/theaters").page_theaters
  end

  it "should pull out no more then 5 theaters" do
    @theaters.size.should eq(5)
  end
  
  describe Theater do
    before :all do
      @theater = @theaters[1]
    end

    it "name should match expression" do
      expect(@theater[:name]).to match(/(\w|\s)/)
    end

    it "href should be a link" do
      expect(@theater[:href]).to match(/http:\/\/www\.moviefone\.com/)
    end

    describe Movie do

      before :all do
        @movie = @theater[:movies].first
      end
      it "should have a name, href and showtimes" do
        expect(@movie.size).to eq(3)
      end

      it "name should match expression" do
        expect(@movie[:name]).to match(/(\w|\s)/)
      end

      it "href shoud mathc expression" do
        expect(@movie[:href]).to match(/http:\/\/www\.moviefone\.com/)
      end

      it "shotimes returns an array" do
        expect(@movie[:showtimes].class).to be(Array)
      end
    end
  end
end
