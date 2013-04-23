# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ez_enum/version'

Gem::Specification.new do |spec|
  spec.name          = "ez_enum"
  spec.version       = EZEnum::VERSION
  spec.authors       = ["Chris Stefano"]
  spec.email         = ["virtualstaticvoid@gmail.com"]
  spec.description   = %q{Provides a simple abstraction for defining enumerations in a Ruby module. Supports listing members and localization of constant names.}
  spec.summary       = %q{Elegant Enumerations for Ruby and Rails}
  spec.homepage      = "https://github.com/virtualstaticvoid/ez_enum"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
