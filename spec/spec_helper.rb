require 'rspec'
require 'rack/test'

require 'bundler'
Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)

require 'factory_bot'
require_relative 'factories'

require 'simplecov'
SimpleCov.start

# require 'capybara/dsl'
# Capybara.app = Microservice
# Capybara.save_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

def app
  Microservice
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  # config.include Capybara::DSL

  config.include FactoryBot::Syntax::Methods
  
  config.before(:all) do
    DatabaseCleaner.clean
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_record
    with.library :active_model
  end
end
