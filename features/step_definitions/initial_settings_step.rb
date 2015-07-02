
Given(/^A program require "([^"]*)"$/) do |module_required|
  require module_required
end

When(/^the class Data is instantied$/) do
  @data = SearchJsonData::Data.new
end

Then(/^the method data_array return a Array$/) do
  expect(@data.data_array).to be_a(Array)
end
