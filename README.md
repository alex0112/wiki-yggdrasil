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
{:name=>"Yggdrasil",
 :children=>
  [{:name=>"Old Norse", :index=>1, :level=>1, :children=>[]},
   {:name=>"Trees in mythology", :index=>2, :level=>1, :children=>[]},
   {:name=>"Norse cosmology", :index=>3, :level=>1, :children=>[]},
   {:name=>"Norse cosmology", :index=>4, :level=>1, :children=>[]},
   {:name=>"<i>Poetic Edda</i>", :index=>5, :level=>1, :children=>[]},
   {:name=>"<i>Prose Edda</i>", :index=>6, :level=>1, :children=>[]},
   {:name=>"Snorri Sturluson", :index=>7, :level=>1, :children=>[]},
   {:name=>"<i>Fraxinus excelsior</i>", :index=>8, :level=>1, :children=>[]},
   {:name=>"Æsir", :index=>9, :level=>1, :children=>[]},
   {:name=>"Thing (assembly)", :index=>10, :level=>1, :children=>[]},
   {:name=>"Urðarbrunnr", :index=>11, :level=>1, :children=>[]},
   {:name=>"Hvergelmir", :index=>12, :level=>1, :children=>[]},
   {:name=>"Mímisbrunnr", :index=>13, :level=>1, :children=>[]},
   {:name=>"Níðhöggr", :index=>14, :level=>1, :children=>[]},
   {:name=>"Veðrfölnir and eagle", :index=>15, :level=>1, :children=>[]},
   {:name=>"Dáinn, Dvalinn, Duneyrr and Duraþrór",
    :index=>16,
    :level=>1,
    :children=>[]},
   {:name=>"Sacred trees and groves in Germanic paganism and mythology",
    :index=>17,
    :level=>1,
    :children=>[]},
   {:name=>"Ragnarök", :index=>18, :level=>1, :children=>[]}],
 :index=>0,
 :depth=>0}
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
