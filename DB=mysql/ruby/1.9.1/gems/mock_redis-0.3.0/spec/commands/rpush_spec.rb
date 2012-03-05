require 'spec_helper'

describe "#rpush(key)" do
  before { @key = "mock-redis-test:#{__FILE__}" }

  it "returns the new size of the list" do
    @redises.rpush(@key, 'X').should == 1
    @redises.rpush(@key, 'X').should == 2
  end

  it "creates a new list when run against a nonexistent key" do
    @redises.rpush(@key, 'value')
    @redises.llen(@key).should == 1
  end

  it "appends items to the list" do
    @redises.rpush(@key, "bert")
    @redises.rpush(@key, "ernie")

    @redises.lindex(@key, 0).should == "bert"
    @redises.lindex(@key, 1).should == "ernie"
  end

  it "stores values as strings" do
    @redises.rpush(@key, 1)
    @redises.lindex(@key, 0).should == "1"
  end

  it_should_behave_like "a list-only command"
end
