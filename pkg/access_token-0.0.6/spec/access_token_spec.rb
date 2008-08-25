require File.dirname(__FILE__) + '/spec_helper.rb'

# Time to add your specs!
# http://rspec.info/
describe "AccessToken" do

  before(:each) do
    @t = AccessToken::Token.new('doug','secret')
  end

  it "should require username" do
    @t.username.should_not be_empty
  end

  it "should require password" do
    @t.password.should_not be_empty 
  end

  it "should generate valid timestamp" do
    @t.timestamp.should >= Time.now.to_i
  end

  it "should generate key concatenating timestamp, username, and password" do
    @t.key.should == @t.timestamp.to_s + @t.username + @t.password
  end

  it "should generate md5 of key" do
    @t.key_md5.length.should == 32
  end

  it "should generate base64 of md5" do
    @t.key_base64.length.should == 44 
  end

  it "should generate valid token" do
    @t.token.length.should == 55
    @t.validate(@t.token, @t.username, @t.password).should == true
  end

end
