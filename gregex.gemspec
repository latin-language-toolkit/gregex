# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gregex/version'

Gem::Specification.new do |spec|
  spec.name          = "gregex"
  spec.version       = Gregex::VERSION
  spec.authors       = ["lichtr"]
  spec.email         = ["robert.lichtensteiner@gmail.com"]
  spec.summary       = %q{ A regular expression library that covers greek polytonic UTF-8 characters. }
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "www.latin-language-toolkit.net"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
