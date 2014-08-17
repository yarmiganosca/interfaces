With `interfaces`, you can define Interfaces in Ruby# Interfaces

Interfaces (shockingly enough) lets you define interfaces in Ruby. It
lets you say (in code) that for a class to implement an interface, it
has to respond to specific messages. Here's a fake rewrite of
`Enumerable` as an example:

```ruby
require 'interfaces'

interface :Enumerable do
  requires :each

  def map
    values = []
    
    each do |value|
      values << yield
    end
    
    values
  end
  
  ...
end

class Collection
  def each
    for item in collection
      yield item
    end
  end
  
  implement Enumerable
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'interfaces'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install interfaces

## Contributing

1. Fork it ( https://github.com/yarmiganosca/interfaces/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
