require 'spec_helper'

describe "#hmget(key, field [, field, ...])" do
  before do
    @key = "mock-redis-test:hmget"
    @redises.hset(@key, 'k1', 'v1')
    @redises.hset(@key, 'k2', 'v2')
  end

  it "returns the values for those keys" do
    @redises.hmget(@key, 'k1', 'k2').sort.should == %w[v1 v2]
  end

  it "returns nils when there are no such fields" do
    @redises.hmget(@key, 'k1', 'mock-redis-test:nonesuch').
      should == ['v1', nil]
  end

  it "returns nils when there is no such key" do
    @redises.hmget(@key, 'mock-redis-test:nonesuch').should == [nil]
  end

  it "raises an error if given no fields" do
    lambda do
      @redises.hmget(@key)
    end.should raise_error(RuntimeError)
  end

  it_should_behave_like "a hash-only command"
end
