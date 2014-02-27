Gem::Specification.new do |s|
  s.name              = "ook"
  s.version           = "0.0.1"
  s.summary           = "Object Oriented Keys for Redis"
  s.description       = "Call Redis commands on keys created with Nido"
  s.authors           = ["Michel Martens"]
  s.email             = ["michel@soveran.com"]
  s.homepage          = "http://github.com/soveran/ook"

  s.files = `git ls-files`.split("\n")

  s.add_dependency "nido"

  s.add_development_dependency "cutest"
end
