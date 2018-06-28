[![CircleCI](https://circleci.com/gh/noblejasper/danger-kiriban.svg?style=svg)](https://circleci.com/gh/noblejasper/danger-kiriban)

# danger-kiriban

A [Danger](https://github.com/danger/danger) plugin for PullRequest [kiriban](https://www.urbandictionary.com/define.php?term=Kiriban) checker.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'danger-kiriban'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install danger-kiriban

## Usage

Please write to `Dangerfile` like this.
You can easily find kiriban.

```ruby
if kiriban.kiriban?
  message("this PR (#{kiriban.number}) is KIRIBAN!")
end
```

## Development

1.  Clone this repository.
1.  Run `bundle install` to setup dependencies.
1.  Run `bundle exec rake spec` to run the tests.
1.  Make your changes.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/noblejasper/danger-kiriban.
