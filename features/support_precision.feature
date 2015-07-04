Feature: Support Precision

    Scenario: Search with Precision
    The capital letter is a lowercase, so there are not results
        Given A program require "search_json_data"
        When Searching "scripting" by field "Type" with precision
        Then has not results

    Scenario: Search without Precision
    The capital letter is a lowercase, so there are results
        Given A program require "search_json_data"
        When Searching "scripting" by field "Type" without precision
        Then has results

    Scenario: Search without Precision
    The capital letter is a Uppercase, so there are results
        Given A program require "search_json_data"
        When Searching "Scripting" by field "Type" with precision
        Then has results