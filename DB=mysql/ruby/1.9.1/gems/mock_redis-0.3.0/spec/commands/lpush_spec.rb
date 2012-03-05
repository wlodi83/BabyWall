require 'spec_helper'

describe "#lpush(key, value)" do
  before { @key = 'mock-redis-test:57367' }

  it "returns the new size of the list" do
    @redises.lpush(@key, 'X').should == 1
    @redises.lpush(@key, 'X').should == 2
  end

  it "creates a new list when run against a nonexistent key" do
    @redises.lpush(@key, 'value')
    @redises.llen(@key).should == 1
  end

  it "prepends items to the list" do
    @redises.lpush(@key, "bert")
    @redises.lpush(@key, "ernie")

    @redises.lindex(@key, 0).should == "ernie"
    @redises.lindex(@key, 1).should == "bert"
  end

  it "stores values as strings" do
    @redises.lpush(@key, 1)
    @redises.lindex(@key, 0).should == "1"
  end

  it_should_behave_like "a list-only command"
end
