# ReadableIdent

UUIDs are great, but not really easy to remember and compare by humans. 
At many points you might need a human readable ident, that is not the database id field. 
To use the database id might be appealing, but if you need to backup and probably restore data this is no good. 

This gem aims to help you generate unique short idents for ActiveRecord models. 

It makes it possible to autogenerate a quiet readable unique ident, that consists of an (optional) prefix and a variable amount of [a-zA-Z0-9]{n}. 

e.g. device-9fX compared to 170a3d59-db5d-48d4-b064-1fd127fde049

For example if you decide to use the signs, there are (26*2 + 10)^3 = 238.328 possible combinations, that should be enough for most cases. 


## Installation

Add this line to your application's Gemfile:

    gem 'readable_ident'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install readable_ident

## Usage

First create a migration to add a field to the model

```rails g migration add_ident_to_device ident:string```

Then add the following to your model:

```
class SomeModel < ActiveRecord::Base
  generate_ident :ident, prefix: 'p-', length: 5
end
```

This will automatically generate an ident for the given field (:ident) with the prefix 'p-' and the length of 5 e.g. p-iq12xk


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
