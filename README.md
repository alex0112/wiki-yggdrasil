# Wiki::Yggdrasil
![Travis CI Build](https://travis-ci.org/alex0112/wiki-yggdrasil.svg?branch=master)

You.  You're up late at night again reading up on some obscure mathematical topic.  You find yourself with *so many* open tabs on Wikipedia.  Wouldn't it be nice if you could just pick an article, and then view a tree of the articles it references?

Introducing Wiki::Yggdrasil.  Named after the tree in Norse mythology that drinks from the well of all wisdom, Wiki::Yggdrasil is here to help you drink just as deeply from the well of wisdom that is Wikipedia.

Wiki::Yggdrasil takes a Wikipedia URI as an argument, and proceeds to spider out a dependency tree of referenced articles.

## Usage
```ruby
require 'wiki/yggdrasil'

@tree               = Wiki::Yggdrasil::Yggdrasil.new(uri: 'http://en.wikipedia.org/wiki/Yggdrasil')
referenced_articles = @tree.children(depth: 3) ## A hash of of articles linked by the parent
```

## FAQ

### This is taking a long time.  Is that normal?
Yes.  This is normal. Any Yggdrasil object created with a depth of three or higher will likely take a few minutes to scrape the necessary information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wiki-yggdrasil'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wiki-yggdrasil


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alex0112/wiki-yggdrasil.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
