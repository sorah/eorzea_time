# EorzeaTime: A clock in the eorzea

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eorzea_time'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eorzea_time

## Usage

``` ruby
et = EorzeaTime.now
et = EorzeaTime.from_time(Time.now)

p et.to_s
p et.hour
p et.min
p et.sec

p et.next_occurrence()
p et.next_occurrence(time: Time.now)
p et.next_occurrence(time: Time.now, count: 2)

p et.last_occurrence()
p et.last_occurrence(time: Time.now)
p et.last_occurrence(time: Time.now, count: 2)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sorah/eorzea_time.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Credit

- Implementation idea based on https://github.com/flowercartelet/eorzea-time
- FINAL FANTASY is a registered trademark of Square Enix Holdings Co., Ltd.
  - FINAL FANTASY XIV (c) 2010-2018 SQUARE ENIX CO., LTD. All Rights Reserved.
