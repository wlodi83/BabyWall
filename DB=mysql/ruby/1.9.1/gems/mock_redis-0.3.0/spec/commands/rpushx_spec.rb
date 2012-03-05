require 'spec_helper'

describe "#rpushx(key, value)" do
  before { @key = 'mock-redis-test:92925' }

  it "returns the new size of the list" do
    @redises.lpush(@key, 'X')

    @redises.rpushx(@key, 'X').should == 2
    @redises.rpushx(@key, 'X').should == 3
  end

  it "does nothing when run against a nonexistent key" do
    @redises.rpushx(@key, 'value')
    @redises.get(@key).should be_nil
  end

  it "appends items to the list" do
    @redises.lpush(@key, "bert")
    @redises.rpushx(@key, "ernie")

    @redises.lindex(@key, 0).should == "bert"
    @redises.lindex(@key, 1).should == "ernie"
  end

  it "stores values as strings" do
    @redises.rpush(@key, 1)
    @redises.rpushx(@key, 2)
    @redises.lindex(@key, 1).should == "2"
  end

  it_should_behave_like "a list-only command"
end
