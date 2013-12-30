# Makup

Decorator helper and makup for [Draper decorator](https://github.com/drapergem/draper).

[![Build Status](https://travis-ci.org/mjacobus/makup.png?branch=master)](https://travis-ci.org/mjacobus/makup)
[![Coverage Status](https://coveralls.io/repos/mjacobus/makup/badge.png)](https://coveralls.io/r/mjacobus/makup)
[![Code Climate](https://codeclimate.com/github/mjacobus/makup.png)](https://codeclimate.com/github/mjacobus/makup)
[![Dependency Status](https://gemnasium.com/mjacobus/makup.png)](https://gemnasium.com/mjacobus/makup)
[![Gem Version](https://badge.fury.io/rb/makup.png)](http://badge.fury.io/rb/makup)

## Instalation

Add this line to your application's Gemfile:

```ruby
gem 'makup'
```

And then execute:

    $ bundle

## Usage

Create your decorator as a regular draper decorator. When you try to output a date you will have an internacionalized date.

```ruby
decorator.created_at # => "Fri, 27 Dec 2013 20:29:51 -02:00"
```

## Overriding/Adding global behavior

### Overriding

```ruby
# app/helpers/some_helper.rb
module SomeHelper
  def decorate_Time(value)
    I18n.l(value, format: :short)
  end
end


decorator.created_at # 27 Dec 20:29
```

### Creating new makups

```ruby
# app/helpers/some_helper.rb
module SomeHelper
  def decorate_Money(value)
    helper.number_to_currency(value)
  end
end

decorator.price # => "$ 5.00"
```


## Authors

- [Marcelo Jacobus](https://github.com/mjacobus)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
**Do not forget to write tests**
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

