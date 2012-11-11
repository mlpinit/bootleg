require 'spec_helper'

describe Finder do 
  it "should raise an error with no arguments" do
    expect { Finder.new }.to raise_error(ArgumentError)
  end 

  it "should not raise error with one argument" do
    expect { Finder.new("smth") }.to_not raise_error(ArgumentError)
  end

  it "should raise an error with more then one arguments" do 
    expect { Finder.new("smth", "smthelse") }.to raise_error(ArgumentError)
  end
  
  
  describe Href do
    before :all do
      @hrefs = Finder.new('21102').hrefs
    end

    it "should have a size of 3" do
      expect(@hrefs.size).to eq(3)
    end
  end
end
