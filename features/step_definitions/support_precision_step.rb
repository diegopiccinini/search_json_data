When(/^Searching "([^"]*)" by field "([^"]*)" with precision$/) do |phrase, field|
  @data = DataArray.new
  @results=@data.search_by(phrase, field, nil, true)
end

Then(/^has not results$/) do
  expect(@results.count).to be_equal 0
end
When(/^Searching "([^"]*)" by field "([^"]*)" without precision$/) do |phrase, field|
  @data = DataArray.new
  @results=@data.search_by(phrase, field)
end

Then(/^has results$/) do
  expect(@results.count).to be > 0
end
