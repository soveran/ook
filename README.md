Ook
===

Object Oriented Keys for Redis.

Description
-----------

Interact with [Redis][redis] keys in an object oriented way.

```ruby
# Create an instance of Ook by passing
# a Redis client and a key.
k = Ook.new(Redic.new, "foo")

# You can append strings to the original namespace:
k["bar"]["baz"].to_s #=> "foo:bar:baz"

# And if you call Redis commands on it,
# the key will be inserted as the second
# parameter when sent to the Redis client:
k.call("SET", 42) # SET foo 42
k.call("GET")     # GET foo
```

This library is like [Nest][nest], but it doesn't depend on
[redis-rb][redis-rb]. Instead, the use of [Redic][redic] or
compatible clients is recommended.

Usage
-----

You need to suply a Redis client and a key. There are no
restrictions regarding the type of the Redis client, but it must
respond to `call` and the signature must be identical to that of
[Redic][redic].

```ruby
ns = Ook.new(Redic.new, "foo")

ns["bar"]["baz"].call("LPUSH", "42")
ns["bar"]["baz"].call("LLEN") #=> 1

ns2 = ns["bar"]["baz"]
ns2.call("LLEN") #=> 1
```

And you can use any object as a key, not only strings:

```ruby
ns[:bar][42] #=> "foo:bar:42"
```

[redic]: https://github.com/amakawa/redic
[redis]: http://redis.io
[redis-rb]: https://github.com/redis/redis-rb
[nest]: https://github.com/soveran/nest

Installation
------------

```
$ gem install ook
```
