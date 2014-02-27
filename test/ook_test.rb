require "redic"
require_relative "../lib/ook.rb"

scope do
  test "namespaces" do
    k1 = Ook.new(Redic.new, "foo")

    assert_equal "foo:bar", k1["bar"].to_s
  end

  test "call Redis commands on Redic instance" do
    k1 = Ook.new(Redic.new, "foo")

    assert_equal "OK", k1.call("SET", 42)
    assert_equal "42", k1.call("GET")
  end

  test "swap Redis client" do
    k1 = Ook.new(Redic.new, "foo")
    k1.redis = Redic.new

    assert_equal "foo", k1.call("ECHO")
  end

  test "creates new instances" do
    k1 = Ook.new(Redic.new, "foo")
    k2 = k1["bar"]

    assert_equal "foo", k1.to_s
    assert_equal "foo:bar", k2.to_s
  end

  test "inspect" do
    k1 = Ook.new(Redic.new, "foo")

    assert_equal "foo", k1.inspect
  end
end
