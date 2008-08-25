$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'digest/md5'
require 'base64'

module AccessToken
  
  class Token 
    attr_accessor(:timestamp, :username, :password, :key, :key_md5, :key_base64, :token)

    def initialize(username, password)
      @username   = username
      @password   = password
      @timestamp  = Time.now.to_i
      @key        = generate_key
      @key_md5    = generate_key_md5
      @key_base64 = generate_key_base64 
      @token      = generate_token
    end

    def generate_token
      @token = @timestamp.to_s + ':' + @key_base64 
    end

    def validate(token, username, password, secs=nil)
      token_timestamp = token.split(':')[0]
      unless secs.nil?
        return false if Time.now.to_i - token_timestamp.to_i > secs
      end
      token_key = generate_key(token_timestamp, username, password)
      token_digest = generate_key_md5(token_key)
      token_enc = generate_key_base64(token_digest)
      token_enc.chomp!
      token2 = token_timestamp + ":" + token_enc
      token == token2 ? true : false
    end

    private

    def generate_keyy
      @timestamp.to_s + @username + @password
    end

    def generate_key(timestamp=@timestamp.to_s, username=@username, password=@password)
      timestamp + username + password
    end

    def generate_key_md5(key=@key)
      Digest::MD5.hexdigest(key)
    end

    def generate_key_base64(key_md5=@key_md5)
      @key_base64 = Base64.encode64(key_md5)
      @key_base64.chomp!
    end

  end

end
