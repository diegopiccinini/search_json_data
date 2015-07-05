Then(/^which should match "([^"]*)", "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
    expect(@results).to  include( include( "Name" => (match(arg1) and match(arg2) and match(arg3) and match(arg4)) ) )
end

Then(/^not "([^"]*)", "([^"]*)" or "([^"]*)"\.$/) do |arg1, arg2, arg3|
     expect(@results).not_to  include( include( "Name" => (match(arg1) or match(arg2) or match(arg3)) ) )
 end

