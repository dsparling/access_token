#!/usr/bin/env ruby
require 'rubygems'
require 'access_token'

username = 'doug'
password = 'secret'

t = AccessToken::Token.new(username, password)
puts t.token

puts t.validate(t.token, username, password)? 'valid' : 'not valid'
puts t.validate(t.token, username, password, 5)? 'valid' : 'not valid'
sleep 3
puts t.validate(t.token, username, password, 2)? 'valid' : 'not valid'
