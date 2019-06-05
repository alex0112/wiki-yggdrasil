# Wiki::Yggdrasil
![Travis CI Build](https://travis-ci.org/alex0112/wiki-yggdrasil.svg?branch=master)

Wiki::Yggdrasil takes a Wikipedia URI as an argument, and proceeds to spider out a dependency tree of referenced articles.

## Usage
```ruby
require 'wiki/yggdrasil'

@tree               = Wiki::Yggdrasil::Yggdrasil.new(uri: 'http://en.wikipedia.org/wiki/Yggdrasil')
referenced_articles = @tree.children(depth: 1) ## A hash of of articles linked by the parent
```
The preceeding code produces a structure as follows:
```ruby
{:name=>"Help:IPA/English", :children=>[]}
{:name=>"Help:IPA/English", :children=>[]}
{:name=>"Old Norse", :children=>[]}
{:name=>"Help:IPA", :children=>[]}
{:name=>"Trees in mythology", :children=>[]}
{:name=>"Norse cosmology", :children=>[]}
{:name=>"<i>Poetic Edda</i>", :children=>[]}
{:name=>"<i>Prose Edda</i>", :children=>[]}
{:name=>"Snorri Sturluson", :children=>[]}
{:name=>"<i>Fraxinus excelsior</i>", :children=>[]}
{:name=>"Æsir", :children=>[]}
{:name=>"Thing (assembly)", :children=>[]}
{:name=>"Urðarbrunnr", :children=>[]}
{:name=>"Hvergelmir", :children=>[]}
{:name=>"Mímisbrunnr", :children=>[]}
{:name=>"Níðhöggr", :children=>[]}
{:name=>"Veðrfölnir and eagle", :children=>[]}
{:name=>"Dáinn, Dvalinn, Duneyrr and Duraþrór", :children=>[]}
{:name=>"Sacred trees and groves in Germanic paganism and mythology", :children=>[]}
{:name=>"Ragnarök", :children=>[]}
```

_Note: Any Yggdrasil object created with a depth of three or higher will likely take a few minutes to scrape the necessary information._

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
