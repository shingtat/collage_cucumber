require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :driver_path => "/Users/Master/Documents/workspace/Implementation/chromedriver")
end
Capybara.default_wait_time = 12
Capybara.default_driver = :chrome
