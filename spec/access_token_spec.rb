require File.dirname(__FILE__) + '/spec_helper.rb'

describe "AccessToken" do

  before(:each) do
    @t = AccessToken::Token.new('doug','secret','md5')
  end

  it "require username" do
    expect(@t.username).not_to be_empty
  end

  it "require password" do
    expect(@t.password).not_to be_empty
  end

  it "generate valid timestamp" do
    expect(@t.timestamp).to be >= Time.now.to_i
  end

  it "should generate valid token" do
    expect(@t.token.length).to eq(35)
    expect(@t.validate(@t.token, @t.username, @t.password)).to eq(true)
  end

end
