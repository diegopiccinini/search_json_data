When(/^Search interpreted "([^"]*)"$/) do |phrase|
  @data = DataArray.new
  @results=@data.search_by('"' + phrase + '"')
end

Then(/^which should match "([^"]*)"$/) do |finded|
  expect(@results).to all( include("Name" => include(finded)))
end

Then(/^not "([^"]*)"$/) do |finded|
  expect(@results).not_to  include("Name" => include(finded))
end

When(/^Searching "([^"]*)" by field "([^"]*)"$/) do |phrase, field|
  @data = DataArray.new
  @data.search_by(phrase, field)
end

When(/^Searching "([^"]*)" by field "([^"]*)" with "([^"]*)" condition$/) do |phrase, field, condition|
   @results=@data.search_by(phrase, field, condition)
end

Then(/^should return all "([^"]*)" languages$/) do |finded|
  expect(@results).to all ( include("Type" => include(finded) ))
end

Then(/^designed by "([^"]*)"$/) do |finded|
  expect(@results).to all (include("Designed by" => include(finded) ))
end

Then(/^have (\d+) results$/) do |total|
  expect(@results.count).to be_equal total.to_i
end
