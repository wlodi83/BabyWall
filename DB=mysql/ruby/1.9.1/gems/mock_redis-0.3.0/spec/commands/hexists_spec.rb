require 'spec_helper'

describe "#hexists(key, field)" do
  before do
    @key = "mock-redis-test:hexists"
    @redises.hset(@key, 'field', 'value')
  end

  it "returns true if the hash has that field" do
    @redises.hexists(@key, 'field').should be_true
  end

  it "returns false if the hash lacks that field" do
    @redises.hexists(@key, 'nonesuch').should be_false
  end

  it "returns nil when there is no such key" do
    @redises.hexists('mock-redis-test:nonesuch', 'key').should be_false
  end

  it_should_behave_like "a hash-only command"
end
