require 'spec_helper'

describe '#brpop(key [, key, ...,], timeout)' do
  before do
    @list1 = 'mock-redis-test:brpop1'
    @list2 = 'mock-redis-test:brpop2'

    @redises.rpush(@list1, 'one')
    @redises.rpush(@list1, 'two')

    @redises.rpush(@list2, 'ten')
  end

  it "returns [first-nonempty-list, popped-value]" do
    @redises.brpop(@list1, @list2, 1).should == [@list1, 'two']
  end

  it "pops that value off the list" do
    @redises.brpop(@list1, @list2, 1)
    @redises.brpop(@list1, @list2, 1)
    @redises.brpop(@list1, @list2, 1).should == [@list2, 'ten']
  end

  it "ignores empty keys" do
    @redises.brpop('mock-redis-test:not-here', @list1, 1).should ==
      [@list1, 'two']
  end

  it "raises an error on non-integer timeout" do
    lambda do
      @redises.brpop(@list1, @list2, 0.5)
    end.should raise_error(RuntimeError)
  end

  it "raises an error on negative timeout" do
    lambda do
      @redises.brpop(@list1, @list2, -1)
    end.should raise_error(RuntimeError)
  end

  it_should_behave_like "a list-only command"

  context "[mock only]" do
    it "ignores positive timeouts and returns nil" do
      @redises.mock.brpop('mock-redis-test:not-here', 1).should be_nil
    end

    it "raises WouldBlock on zero timeout (no blocking in the mock)" do
      lambda do
        @redises.mock.brpop('mock-redis-test:not-here', 0)
      end.should raise_error(MockRedis::WouldBlock)
    end
  end
end
