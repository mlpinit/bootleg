require_relative 'manager'
class Presenter
  attr_reader :theaters

  def initialize(zipcode)
    @theaters ||= Manager.new(zipcode).extract_theaters
  end
end
