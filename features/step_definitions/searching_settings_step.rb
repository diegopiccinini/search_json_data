When(/^A search for "([^"]*)"$/) do |words|
  @results=@data.search_by(words)
end

Then(/^should match a programming language named "([^"]*)"$/) do |finded|

  expect(@results[0]).to include("Name" => finded)
end
