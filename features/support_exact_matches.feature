Feature: Support Exact Matches

	Scenario: Exact Matches quoted text
		Given A program require "search_json_data"
		When Search interpreted "Thomas Eugene"
		Then  which should match "BASIC"
        But not "Haskell"

    Scenario: Match in different fields
        Given A program require "search_json_data"
        When Searching "Scripting" by field "Type"
        And  Searching "Microsoft" by field "Designed by" with "AND" condition
        Then  should return all "Scripting" languages
        And designed by "Microsoft"
        And have 3 results
