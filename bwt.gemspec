# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bwt/version'

Gem::Specification.new do |spec|
  spec.name          = "bwt"
  spec.version       = Bwt::VERSION
  spec.authors       = ["Jim Barnett"]
  spec.email         = ["james.barnett.jr@gmail.com"]
  spec.summary       = %q{An academic implementation of the Burrows-Wheeler Transform}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.4.2"
  spec.add_development_dependency "minitest", "~> 5.6.0"
  spec.add_development_dependency "debugger", "~> 1.6.8"
end
