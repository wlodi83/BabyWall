module Twitter
  class Version

    # @return [Integer]
    def self.major
      2
    end

    # @return [Integer]
    def self.minor
      0
    end

    # @return [Integer]
    def self.patch
      2
    end

    # @return [String, NilClass]
    def self.pre
      nil
    end

    # @return [String]
    def self.to_s
      [major, minor, patch, pre].compact.join('.')
    end

  end
end
