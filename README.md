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
After install the gem include in your code this require
```ruby
require 'search_json_data'
```

Then you can instanciate the object
```ruby
# the argument is the path to the json file
@data = DataArray.new /path/to/file/data.json

    # then you can search words in the collection
    #
    # @param words [String] words to search, when are quoted must match exactly
    # @param field [String] the name of the field, is nil by default in this case search in all fields
    # @param condition [String, nil] the condition to search, by default nil to add results to the before search,
    # otherwise AND return only the results in both searches
    # @param precision [Boolean, false] false by default, true is case sensitive
    # @return [Array] collection of matching results
@data.search_by "Scripting Microsoft"
=begin
 return this collection all haches that match with Scripting and Microsoft
[{"Name"=>"ActionScript", "Type"=>"Compiled, Curly-bracket, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Gary Grossman"}, {"Name"=>"AppleScript", "Type"=>"Scripting", "Designed by"=>"Apple Inc."}, {"Name"=>"AWK", "Type"=>"Curly-bracket, Scripting", "Designed by"=>"Alfred Aho, Peter Weinberger, Brian Kernighan"}, {"Name"=>"bash", "Type"=>"Command line interface, Scripting", "Designed by"=>"Brian Fox"}, {"Name"=>"C#", "Type"=>"Compiled, Curly-bracket, Iterative, Object-oriented class-based, Reflective, Procedural", "Designed by"=>"Microsoft"}, {"Name"=>"Candle", "Type"=>"Curly-bracket, Scripting", "Designed by"=>"Henry Luo"}, {"Name"=>"ColdFusion", "Type"=>"Object-oriented class-based, Procedural, Scripting", "Designed by"=>"Adobe Systems"}, {"Name"=>"ECMAScript", "Type"=>"Curly-bracket, Procedural, Reflective, Scripting", "Designed by"=>"Brendan Eich, Ecma International"}, {"Name"=>"F#", "Type"=>"Interactive mode", "Designed by"=>"Microsoft Research, Don Syme"}, {"Name"=>"Fancy", "Type"=>"Compiled, Interactive mode, Metaprogramming, Object-oriented class-based, Scripting", "Designed by"=>"Christopher Bertels"}, {"Name"=>"Groovy", "Type"=>"Compiled, Curly-bracket, Interpreted, Metaprogramming, Object-oriented class-based, Procedural, Reflective, Scripting", "Designed by"=>"James Strachan"}, {"Name"=>"JavaScript", "Type"=>"Curly-bracket, Interpreted, Reflective, Procedural, Scripting, Interactive mode", "Designed by"=>"Brendan Eich"}, {"Name"=>"JScript", "Type"=>"Curly-bracket, Procedural, Reflective, Scripting", "Designed by"=>"Microsoft"}, {"Name"=>"Julia", "Type"=>"Array, Imperative, Interactive mode, Interpreted, Metaprogramming, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Jeff Bezanson, Stefan Karpinski, Viral B. Shah, Alan Edelman"}, {"Name"=>"Lasso", "Type"=>"Procedural, Scripting, Object-oriented class-based", "Designed by"=>"Kyle Jessup"}, {"Name"=>"Lua", "Type"=>"Imperative, Interactive mode, Interpreted, Iterative, Metaprogramming, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Roberto Ierusalimschy, Waldemar Celes, Luiz Henrique de Figueiredo"}, {"Name"=>"Obix", "Type"=>"Compiled, Interactive mode, Object-oriented class-based, Procedural, Reflective, Scripting", "Designed by"=>"Christian Neumanns"}, {"Name"=>"Perl", "Type"=>"Curly-bracket, Imperative, Interactive mode, Interpreted, Metaprogramming, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Larry Wall"}, {"Name"=>"PHP", "Type"=>"Curly-bracket, Imperative, Interpreted, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Rasmus Lerdorf"}, {"Name"=>"Python", "Type"=>"Imperative, Interactive mode, Interpreted, Iterative, Metaprogramming, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Guido van Rossum"}, {"Name"=>"R", "Type"=>"Curly-bracket, Interactive mode, Interpreted, Procedural, Scripting", "Designed by"=>"Ross Ihaka, Robert Gentleman"}, {"Name"=>"REXX", "Type"=>"Command line interface, Interactive mode, Interpreted, Scripting", "Designed by"=>"Mike Cowlishaw"}, {"Name"=>"Ruby", "Type"=>"Imperative, Interpreted, Metaprogramming, Object-oriented class-based, Reflective, Scripting, Interactive mode", "Designed by"=>"Yukihiro Matsumoto"}, {"Name"=>"S-Lang", "Type"=>"Curly-bracket, Interpreted, Procedural, Scripting, Interactive mode", "Designed by"=>"John E. Davis"}, {"Name"=>"Smalltalk", "Type"=>"Compiled, Metaprogramming, Scripting, Interactive mode, Object-oriented class-based, Reflective", "Designed by"=>"Alan Kay, Dan Ingalls, Adele Goldberg"}, {"Name"=>"VBScript", "Type"=>"Interpreted, Procedural, Scripting, Object-oriented class-based", "Designed by"=>"Microsoft"}, {"Name"=>"Visual Basic", "Type"=>"Compiled, Procedural", "Designed by"=>"Microsoft"}, {"Name"=>"Visual FoxPro", "Type"=>"Compiled, Data-oriented, Object-oriented class-based, Procedural", "Designed by"=>"Microsoft"}, {"Name"=>"Windows PowerShell", "Type"=>"Command line interface, Curly-bracket, Interactive mode, Interpreted, Scripting", "Designed by"=>"Microsoft"}, {"Name"=>"X++", "Type"=>"Compiled, Object-oriented class-based, Procedural, Reflective", "Designed by"=>"Microsoft"}]
=end
# to clean the results
@data.clean_results

# you can do a new search
@data.search_by "Scripting", "Type"


=begin
return this collection
 => [{"Name"=>"ActionScript", "Type"=>"Compiled, Curly-bracket, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Gary Grossman"}, {"Name"=>"AppleScript", "Type"=>"Scripting", "Designed by"=>"Apple Inc."}, {"Name"=>"AWK", "Type"=>"Curly-bracket, Scripting", "Designed by"=>"Alfred Aho, Peter Weinberger, Brian Kernighan"}, {"Name"=>"bash", "Type"=>"Command line interface, Scripting", "Designed by"=>"Brian Fox"}, {"Name"=>"Candle", "Type"=>"Curly-bracket, Scripting", "Designed by"=>"Henry Luo"}, {"Name"=>"ColdFusion", "Type"=>"Object-oriented class-based, Procedural, Scripting", "Designed by"=>"Adobe Systems"}, {"Name"=>"ECMAScript", "Type"=>"Curly-bracket, Procedural, Reflective, Scripting", "Designed by"=>"Brendan Eich, Ecma International"}, {"Name"=>"Fancy", "Type"=>"Compiled, Interactive mode, Metaprogramming, Object-oriented class-based, Scripting", "Designed by"=>"Christopher Bertels"}, {"Name"=>"Groovy", "Type"=>"Compiled, Curly-bracket, Interpreted, Metaprogramming, Object-oriented class-based, Procedural, Reflective, Scripting", "Designed by"=>"James Strachan"}, {"Name"=>"JavaScript", "Type"=>"Curly-bracket, Interpreted, Reflective, Procedural, Scripting, Interactive mode", "Designed by"=>"Brendan Eich"}, {"Name"=>"JScript", "Type"=>"Curly-bracket, Procedural, Reflective, Scripting", "Designed by"=>"Microsoft"}, {"Name"=>"Julia", "Type"=>"Array, Imperative, Interactive mode, Interpreted, Metaprogramming, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Jeff Bezanson, Stefan Karpinski, Viral B. Shah, Alan Edelman"}, {"Name"=>"Lasso", "Type"=>"Procedural, Scripting, Object-oriented class-based", "Designed by"=>"Kyle Jessup"}, {"Name"=>"Lua", "Type"=>"Imperative, Interactive mode, Interpreted, Iterative, Metaprogramming, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Roberto Ierusalimschy, Waldemar Celes, Luiz Henrique de Figueiredo"}, {"Name"=>"Obix", "Type"=>"Compiled, Interactive mode, Object-oriented class-based, Procedural, Reflective, Scripting", "Designed by"=>"Christian Neumanns"}, {"Name"=>"Perl", "Type"=>"Curly-bracket, Imperative, Interactive mode, Interpreted, Metaprogramming, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Larry Wall"}, {"Name"=>"PHP", "Type"=>"Curly-bracket, Imperative, Interpreted, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Rasmus Lerdorf"}, {"Name"=>"Python", "Type"=>"Imperative, Interactive mode, Interpreted, Iterative, Metaprogramming, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Guido van Rossum"}, {"Name"=>"R", "Type"=>"Curly-bracket, Interactive mode, Interpreted, Procedural, Scripting", "Designed by"=>"Ross Ihaka, Robert Gentleman"}, {"Name"=>"REXX", "Type"=>"Command line interface, Interactive mode, Interpreted, Scripting", "Designed by"=>"Mike Cowlishaw"}, {"Name"=>"Ruby", "Type"=>"Imperative, Interpreted, Metaprogramming, Object-oriented class-based, Reflective, Scripting, Interactive mode", "Designed by"=>"Yukihiro Matsumoto"}, {"Name"=>"S-Lang", "Type"=>"Curly-bracket, Interpreted, Procedural, Scripting, Interactive mode", "Designed by"=>"John E. Davis"}, {"Name"=>"Smalltalk", "Type"=>"Compiled, Metaprogramming, Scripting, Interactive mode, Object-oriented class-based, Reflective", "Designed by"=>"Alan Kay, Dan Ingalls, Adele Goldberg"}, {"Name"=>"VBScript", "Type"=>"Interpreted, Procedural, Scripting, Object-oriented class-based", "Designed by"=>"Microsoft"}, {"Name"=>"Windows PowerShell", "Type"=>"Command line interface, Curly-bracket, Interactive mode, Interpreted, Scripting", "Designed by"=>"Microsoft"}]

=end

# but if you seach now with condition AND
@data.search-by "Microsoft", "Designed by", "AND"
=begin
you will get this results
 => [{"Name"=>"JScript", "Type"=>"Curly-bracket, Procedural, Reflective, Scripting", "Designed by"=>"Microsoft"}, {"Name"=>"VBScript", "Type"=>"Interpreted, Procedural, Scripting, Object-oriented class-based", "Designed by"=>"Microsoft"}, {"Name"=>"Windows PowerShell", "Type"=>"Command line interface, Curly-bracket, Interactive mode, Interpreted, Scripting", "Designed by"=>"Microsoft"}]
 =end

# you can add another result
@data.search_by "Apple", "Designed by"
=begin
you will get this results
=> [{"Name"=>"JScript", "Type"=>"Curly-bracket, Procedural, Reflective, Scripting", "Designed by"=>"Microsoft"}, {"Name"=>"VBScript", "Type"=>"Interpreted, Procedural, Scripting, Object-oriented class-based", "Designed by"=>"Microsoft"}, {"Name"=>"Windows PowerShell", "Type"=>"Command line interface, Curly-bracket, Interactive mode, Interpreted, Scripting", "Designed by"=>"Microsoft"}, {"Name"=>"AppleScript", "Type"=>"Scripting", "Designed by"=>"Apple Inc."}, {"Name"=>"Delphi", "Type"=>"Compiled, Object-oriented class-based, Reflective", "Designed by"=>"Apple, Niklaus Wirth, Anders Hejlsberg"}, {"Name"=>"Swift", "Type"=>"Compiled", "Designed by"=>"Chris Lattner, Apple Inc."}]
 =end
# serching negative
@data.search_by "Scripting -Microsoft"
=begin
you will get all Scripting languages without Microsoft
 => [{"Name"=>"ActionScript", "Type"=>"Compiled, Curly-bracket, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Gary Grossman"}, {"Name"=>"AppleScript", "Type"=>"Scripting", "Designed by"=>"Apple Inc."}, {"Name"=>"AWK", "Type"=>"Curly-bracket, Scripting", "Designed by"=>"Alfred Aho, Peter Weinberger, Brian Kernighan"}, {"Name"=>"bash", "Type"=>"Command line interface, Scripting", "Designed by"=>"Brian Fox"}, {"Name"=>"Candle", "Type"=>"Curly-bracket, Scripting", "Designed by"=>"Henry Luo"}, {"Name"=>"ColdFusion", "Type"=>"Object-oriented class-based, Procedural, Scripting", "Designed by"=>"Adobe Systems"}, {"Name"=>"ECMAScript", "Type"=>"Curly-bracket, Procedural, Reflective, Scripting", "Designed by"=>"Brendan Eich, Ecma International"}, {"Name"=>"Fancy", "Type"=>"Compiled, Interactive mode, Metaprogramming, Object-oriented class-based, Scripting", "Designed by"=>"Christopher Bertels"}, {"Name"=>"Groovy", "Type"=>"Compiled, Curly-bracket, Interpreted, Metaprogramming, Object-oriented class-based, Procedural, Reflective, Scripting", "Designed by"=>"James Strachan"}, {"Name"=>"JavaScript", "Type"=>"Curly-bracket, Interpreted, Reflective, Procedural, Scripting, Interactive mode", "Designed by"=>"Brendan Eich"}, {"Name"=>"Julia", "Type"=>"Array, Imperative, Interactive mode, Interpreted, Metaprogramming, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Jeff Bezanson, Stefan Karpinski, Viral B. Shah, Alan Edelman"}, {"Name"=>"Lasso", "Type"=>"Procedural, Scripting, Object-oriented class-based", "Designed by"=>"Kyle Jessup"}, {"Name"=>"Lua", "Type"=>"Imperative, Interactive mode, Interpreted, Iterative, Metaprogramming, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Roberto Ierusalimschy, Waldemar Celes, Luiz Henrique de Figueiredo"}, {"Name"=>"Obix", "Type"=>"Compiled, Interactive mode, Object-oriented class-based, Procedural, Reflective, Scripting", "Designed by"=>"Christian Neumanns"}, {"Name"=>"Perl", "Type"=>"Curly-bracket, Imperative, Interactive mode, Interpreted, Metaprogramming, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Larry Wall"}, {"Name"=>"PHP", "Type"=>"Curly-bracket, Imperative, Interpreted, Object-oriented class-based, Reflective, Scripting", "Designed by"=>"Rasmus Lerdorf"}, {"Name"=>"Python", "Type"=>"Imperative, Interactive mode, Interpreted, Iterative, Metaprogramming, Procedural, Reflective, Scripting, Object-oriented class-based", "Designed by"=>"Guido van Rossum"}, {"Name"=>"R", "Type"=>"Curly-bracket, Interactive mode, Interpreted, Procedural, Scripting", "Designed by"=>"Ross Ihaka, Robert Gentleman"}, {"Name"=>"REXX", "Type"=>"Command line interface, Interactive mode, Interpreted, Scripting", "Designed by"=>"Mike Cowlishaw"}, {"Name"=>"Ruby", "Type"=>"Imperative, Interpreted, Metaprogramming, Object-oriented class-based, Reflective, Scripting, Interactive mode", "Designed by"=>"Yukihiro Matsumoto"}, {"Name"=>"S-Lang", "Type"=>"Curly-bracket, Interpreted, Procedural, Scripting, Interactive mode", "Designed by"=>"John E. Davis"}, {"Name"=>"Smalltalk", "Type"=>"Compiled, Metaprogramming, Scripting, Interactive mode, Object-oriented class-based, Reflective", "Designed by"=>"Alan Kay, Dan Ingalls, Adele Goldberg"}]
=end

# Searching with case sensitive precision
@data.search_by "ruby", "Name",nil , true
# non results => []

# Searching with case sensitive precision (by default false)
@data.search_by "ruby", "Name"

# is the same of
@data.search_by "ruby", "Name",nil , false

=begin
you will get this:
 => [{"Name"=>"Ruby", "Type"=>"Imperative, Interpreted, Metaprogramming, Object-oriented class-based, Reflective, Scripting, Interactive mode", "Designed by"=>"Yukihiro Matsumoto"}]
=end

```


## Testing

To run the test run cucumber
```bash
 >cucumber

```

## More Documentation
Run
```bash
yard doc
```
and open this file with your browser doc/index.html