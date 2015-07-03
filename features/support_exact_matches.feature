Feature: Support Exact Matches

	Scenario: show all data
		Given A program require "search_json_data"
		When Search interpreted "Thomas Eugene"
		Then  which should match "BASIC"
        And  but not "Haskell"
