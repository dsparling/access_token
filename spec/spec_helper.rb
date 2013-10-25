require 'rspec'
require 'simplecov'
SimpleCov.start

# Load in all of our supporting code
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'access_token'
