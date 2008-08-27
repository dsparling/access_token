require File.dirname(__FILE__) + '/spec_helper.rb'

# Time to add your specs!
# http://rspec.info/
describe "AccessToken" do

  before(:each) do
    @t = AccessToken::Token.new('doug','secret','md5')
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

  it "should generate valid token" do
    @t.token.length.should == 35 #39
    @t.validate(@t.token, @t.username, @t.password).should == true
  end

end
