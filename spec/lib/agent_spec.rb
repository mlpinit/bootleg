require 'spec_helper'
require 'bootleg/agent'

describe Bootleg::Agent do

  it 'raises ArgumentError if not initialized with a zipcode' do
    expect{described_class.new(not_zipcode: 'hey')}.
      to raise_error(KeyError, 'key not found: :zipcode')
  end

end
