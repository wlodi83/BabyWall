module Jasmine
  module Dependencies

    class << self
      def rspec2?
        safe_gem_check("rspec", ">= 2.0")
      end

      def rails2?
        safe_gem_check("rails", "~> 2.3")
      end

      def rails3?
        safe_gem_check("rails", ">= 3.0")
      end

      private
      def safe_gem_check(gem_name, version_string)
        if Gem::Specification.respond_to?(:find_by_name)
          Gem::Specification.find_by_name(gem_name, version_string)
        elsif Gem.respond_to?(:available?)
          Gem.available?(gem_name, version_string)
        end
      rescue Gem::LoadError
        false
      end

    end
  end
end
