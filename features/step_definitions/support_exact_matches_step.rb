When(/^Search interpreted "([^"]*)"$/) do |phrase|
  @data = DataArray.new
  @results=@data.search_by('"' + phrase + '"')
end

Then(/^which should match "([^"]*)"$/) do |finded|
  expect(@results[0]).to include("Name" => finded)
end

Then(/^but not "([^"]*)"$/) do |finded|
  expect(@results[0]).not_to include("Name" => finded)
end
