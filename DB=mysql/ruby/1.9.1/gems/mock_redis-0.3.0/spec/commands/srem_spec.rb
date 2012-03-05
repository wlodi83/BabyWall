require 'spec_helper'

describe '#srem(key, member)' do
  before do
    @key = 'mock-redis-test:srem'

    @redises.sadd(@key, 'bert')
    @redises.sadd(@key, 'ernie')
  end

  it "returns true if member is in the set" do
    @redises.srem(@key, 'bert').should be_true
  end

  it "returns false if member is not in the set" do
    @redises.srem(@key, 'cookiemonster').should be_false
  end

  it "removes member from the set" do
    @redises.srem(@key, 'ernie')
    @redises.smembers(@key).should == ['bert']
  end

  it "stringifies member" do
    @redises.sadd(@key, '1')
    @redises.srem(@key, 1).should be_true
  end

  it "cleans up empty sets" do
    @redises.smembers(@key).each {|m| @redises.srem(@key, m)}
    @redises.get(@key).should be_nil
  end

  it_should_behave_like "a set-only command"
end
