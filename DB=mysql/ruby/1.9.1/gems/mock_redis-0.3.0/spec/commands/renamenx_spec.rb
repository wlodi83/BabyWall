require 'spec_helper'

describe '#renamenx(key, newkey)' do
  before do
    @key = 'mock-redis-test:renamenx:key'
    @newkey = 'mock-redis-test:renamenx:newkey'

    @redises.set(@key, "oof")
  end

  it "responds with true when newkey does not exist" do
    @redises.renamenx(@key, @newkey).should be_true
  end

  it "responds with false when newkey exists" do
    @redises.set(@newkey, 'monkey')
    @redises.renamenx(@key, @newkey).should be_false
  end

  it "moves the data" do
    @redises.renamenx(@key, @newkey)
    @redises.get(@newkey).should == "oof"
  end

  it "raises an error when key == newkey" do
    lambda do
      @redises.renamenx(@key, @key)
    end.should raise_error(RuntimeError)
  end

  it "leaves any existing value at newkey alone" do
    @redises.set(@newkey, "rab")
    @redises.renamenx(@key, @newkey)
    @redises.get(@newkey).should == "rab"
  end
end
