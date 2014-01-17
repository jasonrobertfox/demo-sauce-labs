begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'sauce'
require 'sauce/cucumber'

#using the cucumber.yml to pic the driver depending on situation
driver = ENV['DRIVER'] || 'headless'

if driver == 'headless'
  Capybara.default_driver = :poltergeist
  puts "driver is poltergeist"
elsif driver == 'selenium'
  Capybara.default_driver = :selenium
  puts "driver is selenium"
else
  Capybara.default_driver = :sauce
  puts "driver is sauce"
end

Capybara.app_host = 'http://localhost:4567'
World(Capybara)

#more details https://github.com/sauce-labs/sauce_ruby/wiki/Cucumber-and-Capybara
#this is promissing https://github.com/sgrove/cucumber_sauce

#not the cleanest way to do this...
browser = ENV['BROWSER'] || 'ie'
if browser == 'ie8'
  browser_config = ["Windows 7","Internet Explorer","8"]
  puts "running in IE 8 on Windows 7"
elsif browser == 'ie10'
  browser_config = ["Windows 8","Internet Explorer","10"]
  puts "running in IE 10 on Windows 8"
else
  browser_config = ["OS X 10.6","CHROME","26"]
  puts "running in Chrome on OSX"
end

Sauce.config do |c|
  #configure to use sauce-connect to start the tunnel
  c[:start_tunnel] = true
  c[:browsers] = [browser_config]
end
