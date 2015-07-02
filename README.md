# SearchJsonData

###Minimum requirements:

    A search for Lisp Common should match a programming language named "Common Lisp"
    Your solution will be tested on a server running Ubuntu, Ruby 2.1 and Rails 4.2

###Meriting:

    Writing code with reusability in mind
    Search match precision
    Search results ordered by relevance
    Support for exact matches, eg. Interpreted "Thomas Eugene", which should match "BASIC", but not "Haskell"
    Match in different fields, eg. Scripting Microsoft should return all scripting languages designed by "Microsoft"
    Support for negative searches, eg. john -array, which should match "BASIC", "Haskell", "Lisp" and "S-Lang", but not "Chapel", "Fortran" or "S".

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'search_json_data'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install search_json_data

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/search_json_data/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
