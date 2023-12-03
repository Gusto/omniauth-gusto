lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-gusto/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-gusto'
  spec.version       = OmniauthGusto::VERSION
  spec.authors       = %w[juliannaroen lisasli]
  spec.email         = ['julianna.roen@gusto.com', 'lisa.li@gusto.com']

  spec.summary       = 'Official OmniAuth strategy for Gusto'
  spec.description   = 'OmniAuth strategy for authenticating to use Gusto’s API with OAuth 2'
  spec.homepage      = 'https://github.com/Gusto/omniauth-gusto'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.7'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
end
