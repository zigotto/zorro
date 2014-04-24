# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zorro/version'

Gem::Specification.new do |spec|
  spec.name          = "zorro"
  spec.version       = Zorro::VERSION
  spec.authors       = ["Jesus Lopes"]
  spec.email         = ["jlopes@zigotto.com.br"]
  spec.summary       = %q{Helps you with your development workflow}
  spec.homepage      = "https://github.com/zigotto/zorro"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "commander"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
