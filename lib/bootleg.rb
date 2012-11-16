require "bootleg/version"
require "presenter"

module Bootleg
  def self.load(zipcode)
    Presenter.new(zipcode)
  end
end
