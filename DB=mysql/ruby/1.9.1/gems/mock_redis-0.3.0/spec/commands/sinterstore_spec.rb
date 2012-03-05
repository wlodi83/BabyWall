require 'spec_helper'

describe '#sinterstore(destination, key [, key, ...])' do
  before do
    @numbers     = 'mock-redis-test:sinterstore:numbers'
    @evens       = 'mock-redis-test:sinterstore:evens'
    @primes      = 'mock-redis-test:sinterstore:primes'
    @destination = 'mock-redis-test:sinterstore:destination'

    (1..10).each {|i| @redises.sadd(@numbers, i) }
    [2, 4, 6, 8, 10].each {|i| @redises.sadd(@evens, i) }
    [2, 3, 5, 7].each {|i| @redises.sadd(@primes, i) }
  end

  it "returns the number of elements in the resulting set" do
    @redises.sinterstore(@destination, @numbers, @evens).should == 5
  end

  it "stores the resulting set" do
    @redises.sinterstore(@destination, @numbers, @evens)
    @redises.smembers(@destination).should == %w[10 2 4 6 8]
  end

  it "does not store empty sets" do
    @redises.sinterstore(@destination, 'mock-redis-test:nonesuch', @numbers).should == 0
    @redises.get(@destination).should be_nil
  end

  it "removes existing elements in destination" do
    @redises.sadd(@destination, 42)

    @redises.sinterstore(@destination, @primes)
    @redises.smembers(@destination).should == %w[2 3 5 7]
  end

  it "raises an error if given 0 sets" do
    lambda do
      @redises.sinterstore(@destination)
    end.should raise_error(RuntimeError)
  end

  it "raises an error if any argument is not a a set" do
    @redises.set('mock-redis-test:notset', 1)

    lambda do
      @redises.sinterstore(@destination, @numbers, 'mock-redis-test:notset')
    end.should raise_error(RuntimeError)

    lambda do
      @redises.sinterstore(@destination, 'mock-redis-test:notset', @numbers)
    end.should raise_error(RuntimeError)
  end
end
