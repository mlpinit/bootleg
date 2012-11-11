require "bootleg/version"
require "presenter"

module Bootleg
  def self.presenter(zipcode)
    Presenter.new(zipcode)
  end
end
