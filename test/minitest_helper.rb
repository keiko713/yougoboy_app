ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/rails'
require 'minitest/pride'
require 'minitest/matchers'
require 'valid_attribute'
require 'factory_girl'

FactoryGirl.find_definitions

MiniTest::Rails.override_testunit!

# Add `gem "minitest/rails/capybara"` to the test group of your Gemfile
# and uncomment the following if you want Capybara feature tests
# require "minitest/rails/capybara"

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end
