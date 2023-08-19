ENV["RACK_ENV"] = "test"

require 'rspec'
require 'rack/test'

require 'bundler'
Bundler.require(:default, :test)


require File.expand_path('../../config/environment.rb', __FILE__)

require 'factory_bot'
require_relative 'factories'

require 'simplecov'
SimpleCov.start


def app
  Microservice
end


RSpec.configure do |config|
  config.include Rack::Test::Methods
  
  config.include FactoryBot::Syntax::Methods
  
  DatabaseCleaner.strategy = :truncation
  
  config.before(:each) do
    DatabaseCleaner.clean
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
