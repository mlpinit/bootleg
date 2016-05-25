No longer maintained - Moviefone changed their format

# Bootleg

Bootleg represents my playground for scraping movies from
[moviefone.com](http://moviefone.com)

## If you want you can play with it as well

To gain access to the gem simply:

```
require 'bootleg'
```

Currently Bootleg supports search for movies and theaters within a certain
zipcode.

```
agent = Bootleg::Agent.new(zipcode: 20851)
```

The bootleg agent is responsible for initializing the enviornment and providing
a simple method ``page`` that gives us access to the first search results.

```
page = agent.page
```

A page has two handy methods. The ``theaters`` method gives you an array with
all the available theaters. You have access to a theater's title, link, price
for an adult or the price for a child as well as the address of the theater and
the movies that are currently palying at that theater. The page also has a
``next`` method that give you access to the next page. You can keep navigating
through the search results until ``page.next`` returns _Last Page_.

```
page = page.next
```

Within theaters you also have access to movies. A movie has attributes for title
link and showtimes.

```
theaters = page.theaters
```

This gives you a list of theaters on the current page.

For example if you would like access to all the movies that run in a certain
theater you could do the following.

```
theaters.first.movies
```
If you need to scrape additional information from either theaters or movies it is
fairly easy to extend either the theater class or the movies class.

## TODO

Some of the main improvements this gem could use is better error support for
different edge cases. The gem could also benefit from more tests to ilustrate
some of the patterns identified while scrapping movies and theaters.
