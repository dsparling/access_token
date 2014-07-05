require File.dirname(__FILE__) + '/spec_helper.rb'

describe "AccessToken" do

  context "with md5" do
    before(:each) do
      @t_md5 = AccessToken::Token.new('doug','secret','md5')
    end

    it "require username" do
      expect(@t_md5.username).not_to be_empty
    end

    it "require password" do
      expect(@t_md5.password).not_to be_empty
    end

    it "generate valid timestamp" do
      expect(@t_md5.timestamp).to be >= Time.now.to_i
    end

    it "should generate valid token" do
      expect(@t_md5.token.length).to eq(35)
      expect(@t_md5.validate(@t_md5.token, @t_md5.username, @t_md5.password)).to eq(true)
    end
  end

  context "with sha1" do
    before(:each) do
      @t_sha1 = AccessToken::Token.new('doug','secret','sha1')
    end

    it "require username" do
      expect(@t_sha1.username).not_to be_empty
    end

    it "require password" do
      expect(@t_sha1.password).not_to be_empty
    end

    it "generate valid timestamp" do
      expect(@t_sha1.timestamp).to be >= Time.now.to_i
    end

    it "should generate valid token" do
      expect(@t_sha1.token.length).to eq(39)
      expect(@t_sha1.validate(@t_sha1.token, @t_sha1.username, @t_sha1.password)).to eq(true)
    end
  end

  context "with short TTL" do
    before(:each) do
      @t_sha1 = AccessToken::Token.new('doug','secret','sha1')
    end

    it "should consider token after requested time period" do
      sleep 2
      expect(@t_sha1.validate(@t_sha1.token, @t_sha1.username, @t_sha1.password, 1)).to eq(true)
    end
  end

end
