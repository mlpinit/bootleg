class BootlegTheater < ActiveRecord::Base
  attr_accessible :name, :href

  has_many :bootleg_showtimes
  has_many :movies, through: :bootleg_showtimes, source: :bootleg_movie

  def showtimes
    bootleg_showtimes
  end
end
