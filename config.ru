require 'sinatra'
require 'sinatra/base'
require 'sinatra/contrib'

require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

run Microservice