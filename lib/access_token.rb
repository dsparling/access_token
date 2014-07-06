$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'digest/sha1'
require 'digest/md5'
require 'base64'

module AccessToken

  class Token
    attr_accessor(:timestamp, :username, :password, :token, :digest)

    def initialize(username, password, digest='sha1')
      @username   = username
      @password   = password
      @digest     = digest
      @timestamp  = Time.now.to_i
      @token      = generate_token
    end

    def generate_token(timestamp=@timestamp.to_s, username=@username, password=@password)
      key = timestamp + username + password
      if @digest == 'sha1'
        @token = timestamp + ':' + Base64.encode64(Digest::SHA1.digest(key)).chomp! 
      else
        @token = timestamp + ':' + Base64.encode64(Digest::MD5.digest(key)).chomp! 
      end
    end

    def validate(token, username, password, secs=nil)
      token_timestamp = token.split(':')[0]
      unless secs.nil?
        return false if Time.now.to_i - token_timestamp.to_i > secs
      end
      token2 = generate_token(token_timestamp, username, password)
      token == token2 ? true : false
    end

  end

end
