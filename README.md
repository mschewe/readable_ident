# ReadableIdent


## Installation

Add this line to your application's Gemfile:

    gem 'readable_ident'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install readable_ident

## Usage

```
class SomeModel < ActiveRecord::Base

  generate_ident :ident, prefix: 'p-', length: 5

end
```

This will automatically generate an ident for the given field (:ident) with the prefix 'p-' and the length of 5.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
