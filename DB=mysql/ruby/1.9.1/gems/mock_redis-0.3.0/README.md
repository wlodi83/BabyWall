# MockRedis

A mock redis gem.

MockRedis provides the same interface as redis-rb, but it stores its
data in memory instead of talking to a Redis server. It is intended
for use in tests.

## Getting Started

It's as easy as `require 'mock_redis'; mr = MockRedis.new`. Then you can
call the same methods on it as you can call on a real `Redis` object.

For example:

    >> require 'mock_redis'
    >> mr = MockRedis.new
    >> mr.set('some key', 'some value')
    => "OK"
    >> mr.get('some key')
    => "some value"

## Supported Features

mock_redis supports most of the methods that redis-rb does. Examples
of supported methods:

* String methods: `get`, `set`, `append`, `incr`, etc.
* List methods: `lpush`, `lpop`, `lrange`, `rpoplpush`, etc.
* Set methods: `sadd`, `sinter`, `sismember`, etc.
* Hash methods: `hset`, `hget`, `hgetall`, `hmget`, etc.
* Sorted set methods: `zadd`, `zrank`, `zunionstore`, etc.
* Expirations: `expire`, `ttl`, etc.
* Transactions: `multi`, `exec`, `discard`

## Mostly-Supported Commands

A MockRedis object can't do everything that a real Redis client can
since it's an in-memory object confined to a single process. MockRedis
makes every attempt to be Redis-compatible, but there are some
necessary exceptions.

* Blocking list commands (`#blpop`, `#brpop`, and `#brpoplpush`) work
  as expected if there is data for them to retrieve. If you use one of
  these commands with a nonzero timeout and there is no data for it to
  retrieve, then the command returns immediately. However, if you ask
  one of these commands for data with a 0 timeout (means "wait
  forever") and there is no data available, then a
  `MockRedis::WouldBlock` exception is raised. It's not what a real
  Redis client would do, but it beats hanging your test run forever.

* `#info` just returns canned values; they don't update over time.

## Unsupported Commands

Some stuff, we just can't do with a single Ruby object in a single
Ruby process.

* Debugging commands (`#debug('object', key)` and
  `#debug('segfault')`) aren't available.

* `#object` isn't available since we don't have any Redis internals to
  poke at.

* `#monitor` isn't available; there's no place for requests to come
  from, so there's nothing to receive.

* Pubsub commands (`#psubscribe`, `#publish`, `#punsubscribe`) aren't
  available.

* `#slowlog` isn't available.

## Remaining Work

There are some things we want to have in here, but that we just
haven't gotten to doing yet. If you're interested in helping out,
please submit a pull request with your (tested!) implementation.

* `#config(:get|:set|:resetstat)` isn't done. They can just return
  canned values.

* `#sort` isn't done. We just haven't gotten to it yet. The input
  validation will be a pain in the butt, but other than that, it
  shouldn't be too bad.

## Running the Tests

If you want to work on this, you'll probably want to run the
tests. (Just kidding! There's no probably about it.) These tests were
written with Redis 2.2.11 running on localhost without any passwords
required. If you're using a different version of Redis, you may see
failures due to error message text being different. If you're running
a really old version of Redis, you'll definitely see failures due to
stuff that doesn't work!
