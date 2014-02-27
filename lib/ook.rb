class Ook

  # The Redis client can be swapped at any point.
  attr_accessor :redis

  # Receive a Redis client and a key. There are no restrictions
  # regarding the type of the Redis client, but it must respond to
  # `call` and the signature must be identical to that of Redic.
  def initialize(redis, key)
    @ns = key
    @redis = redis
  end

  # The passed key will be appended to the previous namespace.
  def [](key)
    self.class.new(redis, sprintf("%s:%s", @ns, key))
  end

  def inspect
    @ns
  end

  alias to_s inspect

  # Call commands on the Redis client after inserting the key
  # in the second position. Return the result of the command.
  def call(cmd, *args)
    @redis.call(cmd, @ns, *args)
  end
end
