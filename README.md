# Bootleg

Bootleg is a basic scraper. It scrapes movie, theater and showtime
details from moviefone.com based on a certain zipcode for a 25 mile
radius.

## Installation

Add this line to your application's Gemfile:

    gem 'bootleg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootleg

Generate models and migrations:

    $ rails generate bootleg:install

## Usage

Load content for a certain zipcode:

Example:

Bootleg.load('21102')

This will load all the movies for a 25 mile radius(including their showtimes
and the theaters where they play).

Examples:

    $ movie = BootlegMovie.where(name: 'Example').first

Get all the theaters where the movie is played:

    $ theaters = movie.theaters

Get all the showtimes:

    $ showtimes = movie.showtimes

Get the theater of the showtimes:

    $ theater = showtimes.first.theater


The content is stored in 3 Active Record models BootlegMovie,
BootlegTheater and BootlegShowtime. After you load a zipcode just start
a rails console and take a look at the models to see what information is
stored inside.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

If there is other content that you would like to pull it is relatively easy
to build a new feature to extract it. If you would like to contribute
and need help feel free to shoot me an email at marius@mlpinit.com .
