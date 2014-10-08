# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fyber_api_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "fyber_api_wrapper"
  spec.version       = FyberApiWrapper::VERSION
  spec.authors       = ["yurivm"]
  spec.email         = ["yuri.veremeyenko@gmail.com"]
  spec.summary       = %q{A wrapper over the Fyber Wall API}
  spec.description   = %q{This gem wraps the Fyber Wall API and allows you to perform offer requests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "jazz_hands"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "simplecov", "~> 0.9.0"
end
