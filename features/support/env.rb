require 'site_prism'
require 'capybara/dsl'

Capybara.default_driver = :selenium
Capybara.ignore_hidden_elements = false
Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new app, browser: :chrome
end

Before do
    Capybara.page.current_window.resize_to(550,800)
end