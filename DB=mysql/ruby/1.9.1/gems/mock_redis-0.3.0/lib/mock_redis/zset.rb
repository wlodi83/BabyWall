require 'forwardable'
require 'set'

class MockRedis
  class Zset
    include Enumerable
    extend Forwardable

    attr_reader :members, :scores

    def_delegators :members, :empty?, :include?, :size

    def initialize
      @members = Set.new
      @scores  = Hash.new
    end

    def initialize_copy(source)
      super
      @members = @members.clone
      @scores  = @scores.clone
    end

    def add(score, member)
      members.add(member)
      if score.to_f.to_i == score.to_f
        scores[member] = score.to_f.to_i
      else
        scores[member] = score.to_f
      end
      self
    end

    def delete?(member)
      scores.delete(member)
      members.delete?(member) and self
    end

    def each
      members.each {|m| yield score(m), m}
    end

    def in_range(min, max)
      in_from_the_left = case min
                         when "-inf"
                             lambda {|_| true }
                         when "+inf"
                             lambda {|_| false }
                         when /\((.*)$/
                             val = $1.to_f
                           lambda {|x| x.to_f > val }
                         else
                           lambda {|x| x.to_f >= min.to_f }
                         end

      in_from_the_right = case max
                          when "-inf"
                              lambda {|_| false }
                          when "+inf"
                              lambda {|_| true }
                          when /\((.*)$/
                              val = $1.to_f
                            lambda {|x| x.to_f < val }
                          else
                            lambda {|x| x.to_f <= max.to_f }
                          end

      sorted.find_all do |(score, member)|
        in_from_the_left[score] && in_from_the_right[score]
      end
    end

    def intersection(other)
      if !block_given?
        intersection(other, &:+)
      else
        self.members.intersection(other.members).reduce(self.class.new) do |acc, m|
          new_score = yield(self.score(m), other.score(m))
          acc.add(new_score, m)
        end
      end
    end

    def score(member)
      scores[member]
    end

    def sorted
      members.map do |m|
        [score(m), m]
      end.sort_by(&:first)
    end

    def sorted_members
      sorted.map(&:last)
    end

    def union(other)
      if !block_given?
        union(other, &:+)
      else
        self.members.union(other.members).reduce(self.class.new) do |acc, m|
          new_score = yield(self.score(m), other.score(m))
          acc.add(new_score, m)
        end
      end
    end

  end
end
