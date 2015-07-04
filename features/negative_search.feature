Feature: Negative Searching
  Get a result for searching excluding negative text or collection
	Scenario: Return a result exluding negative expresion
		Given A program require "search_json_data"
		When the class DataArray is instantied
        And A search for "john -array"
		Then which should match "BASIC", "Haskell", "Lisp" and "S-Lang"
        But not "Chapel", "Fortran" or "S".