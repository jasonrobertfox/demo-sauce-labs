Given(/^I am on homepage$/) do
  visit Capybara.app_host
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

Given(/^I follow "(.*?)"$/) do |link|
  click_link(link)
end

Given(/^I am on "(.*?)"$/) do |path|
  visit Capybara.app_host + path
end
