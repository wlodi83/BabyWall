require 'mock_redis/undef_redis_methods'

class MockRedis
  class TransactionWrapper
    include UndefRedisMethods

    def respond_to?(method, include_private=false)
      super || @db.respond_to?(method)
    end

    def initialize(db)
      @db = db
      @queued_commands = []
      @in_multi = false
    end

    def method_missing(method, *args)
      if @in_multi
        @queued_commands << [method, *args]
        'QUEUED'
      else
        @db.expire_keys
        @db.send(method, *args)
      end
    end

    def initialize_copy(source)
      super
      @db = @db.clone
      @queued_commands = @queued_commands.clone
    end

    def discard
      unless @in_multi
        raise RuntimeError, "ERR DISCARD without MULTI"
      end
      @in_multi = false
      @queued_commands = []
      'OK'
    end

    def exec
      unless @in_multi
        raise RuntimeError, "ERR EXEC without MULTI"
      end
      @in_multi = false
      responses = @queued_commands.map do |cmd|
        begin
          send(*cmd)
        rescue => e
          e
        end
      end
      @queued_commands = []
      responses
    end

    def multi
      if @in_multi
        raise RuntimeError, "ERR MULTI calls can not be nested"
      end
      @in_multi = true
      if block_given?
        yield(self)
        self.exec
      else
        'OK'
      end
    end

    def unwatch
      'OK'
    end

    def watch(_)
      'OK'
    end

  end
end
