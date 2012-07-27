begin
  require 'spec'
rescue LoadError
  begin
    require 'rubygems'
    gem 'rspec'
    require 'spec'
  rescue LoadError
    gem 'rspec'
    require 'rspec'
  end
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'access_token'
