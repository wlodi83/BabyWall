require 'spec_helper'

describe "#zrevrangebyscore(key, start, stop [:with_scores => true] [:limit => [offset count]])" do
  before do
    @key = 'mock-redis-test:zrevrangebyscore'
    @redises.zadd(@key, 1, 'Washington')
    @redises.zadd(@key, 2, 'Adams')
    @redises.zadd(@key, 3, 'Jefferson')
    @redises.zadd(@key, 4, 'Madison')
  end

  it "returns the elements in order by score" do
    @redises.zrevrangebyscore(@key, 4, 3).should == ['Madison', 'Jefferson']
  end

  it "returns the scores when :with_scores is specified" do
    @redises.zrevrangebyscore(@key, 4, 3, :with_scores => true).
      should == %w[Madison 4 Jefferson 3]
  end

  it "returns the scores when :withscores is specified" do
    @redises.zrevrangebyscore(@key, 4, 3, :withscores => true).
      should == %w[Madison 4 Jefferson 3]
  end

  it "treats +inf as positive infinity" do
    @redises.zrevrangebyscore(@key, "+inf", 3).
      should == %w[Madison Jefferson]
  end

  it "honors the :limit => [offset count] argument" do
    @redises.zrevrangebyscore(@key, 100, -100, :limit => [1, 2]).
      should == ["Jefferson", "Adams"]
  end

  it "raises an error if :limit isn't a 2-tuple" do
    lambda do
      @redises.zrevrangebyscore(@key, 100, -100, :limit => [1, 2, 3])
    end.should raise_error(RuntimeError)

    lambda do
      @redises.zrevrangebyscore(@key, 100, -100, :limit => "1, 2")
    end.should raise_error(RuntimeError)
  end

  it_should_behave_like "a zset-only command"
end
