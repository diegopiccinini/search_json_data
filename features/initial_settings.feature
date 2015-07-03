Feature: Initials Setting
  Checking the valid settings
	Scenario: show all data
		Given A program require "search_json_data"
		When the class DataArray is instantied
		Then the method data_array return a Array
	Scenario: show all data by argument
		Given A program require "search_json_data"
		When the class DataArray is instantied with "example.json"
		Then the method data_array return a Array