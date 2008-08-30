= access_token


== DESCRIPTION:

Generate and validate simple time-based access token

== FEATURES/PROBLEMS:

TODO: Multiple time formats
      1/100th seconds
      Use ARGV for bin script for username and password

== SYNOPSIS:

#!/usr/bin/env ruby
require 'rubygems'
require 'access_token'

username = 'doug'
password = 'secret'

t = AccessToken::Token.new(username, password)
puts t.token

# token should be valid 
puts t.validate(t.token, username, password)? 'valid' : 'not valid'
# token should be valid for 5 seconds 
puts t.validate(t.token, username, password, 5)? 'valid' : 'not valid'
# wait 3 seconds 
sleep 3
# token should be invalid if it's only valid for 2 seconds
puts t.validate(t.token, username, password, 2)? 'valid' : 'not valid'


== REQUIREMENTS:


== INSTALL:

$ sudo gem install dsparling-access_token

or 

$ git clone git://github.com/dsparling/access_token.git
$ cd access_token
$ sudo ruby setup.rb

== LICENSE:

(The MIT License)

Copyright (c) 2008 doug sparling 

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
