Feature: Initials Setting
  Checking the valid settings
	Scenario: show all data
		Given A program require "search_json_data"
		When the class Data is instantied
		Then the method data_array return a Array
