## Introduction

Interfaces (shockingly enough) lets you define interfaces in Ruby. It
lets you specify (in code) that for a class to implement an interface,
it has to respond to specific messages.

Here's a fake rewrite of
`Enumerable` as an example:

```ruby
require 'interfaces'

interface :Enoomerable do
  requires :each

  def map
    values = []
    
    each do |value|
      values << yield(value)
    end
    
    values
  end
end

class Collection
  def each
    for item in items
      yield item
    end
  end
  
  implement Enoomerable
end
```

Now, our `Collection` class has access to the rest of methods defined
in `Enoomerable`. But if we tried

```ruby
class BadCollection
  implement Enoomerable
end
```

then it would blow up in our faces.


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
