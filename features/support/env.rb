require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :driver_path => "/usr/local/bin/chromedriver")
end
Capybara.default_wait_time = 12
Capybara.default_driver = :chrome


# From https://stackoverflow.com/questions/26913436/how-to-send-javascript-based-in-a-element-in-capybara
class Capybara::Session 
  def execute_script(script, *args)
    @touched = true
    driver.execute_script(script, *args)
  end
end

# From https://stackoverflow.com/questions/26913436/how-to-send-javascript-based-in-a-element-in-capybara
class Capybara::Selenium::Driver 
  def execute_script(script, *args)
    args.map! { |e| e.kind_of?(Capybara::Node::Element) ? e.native : e }
    browser.execute_script(script, *args)
  end
end

# Both classes above are used to pass arguments into js scripts

# From https://stackoverflow.com/questions/3233278/how-do-i-test-if-all-items-in-an-array-are-identical
class Array
  def same_values?
    self.uniq.length == 1
  end
end
