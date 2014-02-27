Gem::Specification.new do |s|
  s.name              = "ook"
  s.version           = "0.0.2"
  s.summary           = "Object Oriented Keys for Redis"
  s.description       = "Call commands on Redis keys"
  s.authors           = ["Michel Martens"]
  s.email             = ["michel@soveran.com"]
  s.homepage          = "http://github.com/soveran/ook"

  s.files = `git ls-files`.split("\n")

  s.add_development_dependency "cutest"
end
