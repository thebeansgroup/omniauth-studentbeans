# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/studentbeans/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-studentbeans'
  spec.version       = OmniAuth::Studentbeans::VERSION
  spec.authors       = ['Seren Altiner', 'Vincent Siebert']
  spec.email         = ['seren@thebeansgroup.com', 'vincent@siebert.im']
  spec.summary       = 'Student Beans OAuth2 strategy for OmniAuth'
  spec.homepage      = 'https://github.com/thebeansgroup/omniauth-studentbeans'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth'
  spec.add_runtime_dependency 'omniauth-oauth2', '= 1.3.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
