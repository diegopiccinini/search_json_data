Feature: Searching
  Get a result for the searching
	Scenario: return a result
		Given A program require "search_json_data"
		When the class Data is instantied
        And A search for "Lisp Common"
		Then should match a programming language named "Common Lisp"
