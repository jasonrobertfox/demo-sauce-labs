begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'sauce'
require 'sauce/cucumber'

Capybara.default_driver = :poltergeist
Capybara.app_host = 'http://localhost:4567/'
World(Capybara)

Sauce.config do |c|
  c[:start_tunnel] = true

  c.browsers = [
    ["OS X 10.6","CHROME","26"],
    ["Windows 7","IE","7"],
    ["Windows 7","Firefox","18"],
    ["Windows 7","Opera","11"]
  ]
end
