require 'spec_helper'

describe "#zinterstore(destination, keys, [:weights => [w,w,], [:aggregate => :sum|:min|:max])" do
  before do
    @odds   = 'mock-redis-test:zinterstore:odds'
    @primes = 'mock-redis-test:zinterstore:primes'
    @dest   = 'mock-redis-test:zinterstore:dest'

    @redises.zadd(@odds, 1, 'one')
    @redises.zadd(@odds, 3, 'three')
    @redises.zadd(@odds, 5, 'five')
    @redises.zadd(@odds, 7, 'seven')
    @redises.zadd(@odds, 9, 'nine')

    @redises.zadd(@primes, 2, 'two')
    @redises.zadd(@primes, 3, 'three')
    @redises.zadd(@primes, 5, 'five')
    @redises.zadd(@primes, 7, 'seven')
  end

  it "returns the number of elements in the new set" do
    @redises.zinterstore(@dest, [@odds, @primes]).should == 3
  end

  it "sums the members' scores by default" do
    @redises.zinterstore(@dest, [@odds, @primes])
    @redises.zrange(@dest, 0, -1, :with_scores => true).should ==
      %w[three 6 five 10 seven 14]
  end

  it "removes existing elements in destination" do
    @redises.zadd(@dest, 10, 'ten')

    @redises.zinterstore(@dest, [@primes])
    @redises.zrange(@dest, 0, -1, :with_scores => true).should ==
      %w[two 2 three 3 five 5 seven 7]
  end

  it "raises an error if keys is empty" do
    lambda do
      @redises.zinterstore(@dest, [])
    end.should raise_error(RuntimeError)
  end

  context "the :weights argument" do
    it "multiplies the scores by the weights while aggregating" do
      @redises.zinterstore(@dest, [@odds, @primes], :weights => [2, 3])
      @redises.zrange(@dest, 0, -1, :with_scores => true).should ==
        %w[three 15 five 25 seven 35]
    end

    it "raises an error if the number of weights != the number of keys" do
      lambda do
        @redises.zinterstore(@dest, [@odds, @primes], :weights => [1,2,3])
      end.should raise_error(RuntimeError)
    end
  end

  context "the :aggregate argument" do
    before do
      @smalls = 'mock-redis-test:zinterstore:smalls'
      @bigs   = 'mock-redis-test:zinterstore:bigs'

      @redises.zadd(@smalls, 1, 'bert')
      @redises.zadd(@smalls, 2, 'ernie')
      @redises.zadd(@bigs, 100, 'bert')
      @redises.zadd(@bigs, 200, 'ernie')
    end

    it "aggregates scores with min when :aggregate => :min is specified" do
      @redises.zinterstore(@dest, [@bigs, @smalls], :aggregate => :min)
      @redises.zrange(@dest, 0, -1, :with_scores => true).should ==
        %w[bert 1 ernie 2]
    end

    it "aggregates scores with max when :aggregate => :max is specified" do
      @redises.zinterstore(@dest, [@bigs, @smalls], :aggregate => :max)
      @redises.zrange(@dest, 0, -1, :with_scores => true).should ==
        %w[bert 100 ernie 200]
    end

    it "allows 'min', 'MIN', etc. as aliases for :min" do
      @redises.zinterstore(@dest, [@bigs, @smalls], :aggregate => 'min')
      @redises.zscore(@dest, 'bert').should == '1'

      @redises.zinterstore(@dest, [@bigs, @smalls], :aggregate => 'MIN')
      @redises.zscore(@dest, 'bert').should == '1'
    end

    it "raises an error for unknown aggregation function" do
      lambda do
        @redises.zinterstore(@dest, [@bigs, @smalls], :aggregate => :mix)
      end.should raise_error(RuntimeError)
    end
  end
end
