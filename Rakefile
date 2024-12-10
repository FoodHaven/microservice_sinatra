require "bundler"
Bundler.require

require "sinatra/activerecord"
require "sinatra/activerecord/rake"
require "./microservice_app"

Dir.glob('lib/tasks/*.rake').each { |r| load r}