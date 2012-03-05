require 'spec_helper'

describe '#rename(key, newkey)' do
  before do
    @key = 'mock-redis-test:rename:key'
    @newkey = 'mock-redis-test:rename:newkey'

    @redises.set(@key, "oof")
  end

  it "responds with 'OK'" do
    @redises.rename(@key, @newkey).should == 'OK'
  end

  it "moves the data" do
    @redises.rename(@key, @newkey)
    @redises.get(@newkey).should == "oof"
  end

  it "raises an error when key == newkey" do
    lambda do
      @redises.rename(@key, @key)
    end.should raise_error(RuntimeError)
  end

  it "overwrites any existing value at newkey" do
    @redises.set(@newkey, "rab")
    @redises.rename(@key, @newkey)
    @redises.get(@newkey).should == "oof"
  end
end
