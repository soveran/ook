require "nido"

class Ook

  # The Redis client can be swapped at any point.
  attr_accessor :redis

  # Receive a Redis client and a key. There are no restrictions
  # regardin the type of the Redis client, but it must respond to
  # `call` and the signature must be identical to that of Redic.
  def initialize(redis, key)
    @ns = Nido.new(key)
    @redis = redis
  end

  # The passed key will be appended to the previous namespace.
  def [](key)
    @ns = @ns[key]
    self
  end

  # Return an instance of Nido with the current value.
  def to_s
    @ns
  end

  # Call commands on the Redis client after inserting the key
  # in the second position. Return the result of the command.
  def call(cmd, *args)
    @redis.call(cmd, @ns, *args)
  end
end
