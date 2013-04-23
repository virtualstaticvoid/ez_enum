# EZEnum

Provides a simple abstraction for defining enumerations in a Ruby module. Supports listing members and localization of constant names.

## Installation

Add this line to your application's Gemfile:

    gem 'ez_enum'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ez_enum

## Usage

Define a Ruby module, giving it the name of the desired enumeration. Add constants to the module as needed.
Include `EZEnum` into your module _after_ all constant declarations. E.g.

```ruby
module Status

  New = 1
  Processing = 2
  Failed = 3
  Complete = 4

  # included here, so that constants are used
  include EZEnum

end
```

Your module will now include an `All` constant, which contains an array of the constants defined in the module. E.g.

```ruby
Status::All # => [New, Processing, Failed, Complete]
```

Your will also have the following helper methods add to it:

* `choices_for_select` - returns an array of the localized names and values for each constant. E.g.

  ```ruby
  Status.choices_for_select # => [['New', 1], ['Processing', 2], ...]
  ```

* `display_for(value)` - returns the localized name for the given constant value. E.g.

  ```ruby
  Status.display_for(Status::Failed) # => 'Epic Fail'
  ```

To add support for localization, add sections under the respective language code in your locales file, and using the
downcased name of the module and the downcased name of the constant, provide the corresponding translation. E.g.

```yaml
en:
  enums:
    status:
      new: New
      processing: Processing
      failed: Epic Fail
      completed: Completed
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright
MIT License - Copyright (c) 2013 Chris Stefano
