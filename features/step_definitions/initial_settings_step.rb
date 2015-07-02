
Given(/^A program require "([^"]*)"$/) do |module_required|
  require module_required
end

When(/^the class Data is instantied$/) do
  @data = DataArray.new
end

Then(/^the method data_array return a Array$/) do
  expect(@data.data_array).to be_a(Array)
end
When(/^the class Data is instantied with "([^"]*)"$/) do |file_name|
  @data = DataArray.new File.join(File.dirname(__FILE__),'..','support',file_name)
end
