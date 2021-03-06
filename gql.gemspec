# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'gql/version'

Gem::Specification.new do |spec|
  spec.name          = 'gql'
  spec.version       = GQL::VERSION
  spec.authors       = ['Martin Andert']
  spec.email         = ['mandert@gmail.com']

  spec.summary       = 'A Ruby implementation of Facebook\'s yet-to-be-released GraphQL specification.'
  spec.homepage      = 'https://github.com/martinandert/gql'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.0'

  spec.files         = Dir['README.md', 'LICENSE.txt', 'lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rexical', '~> 1.0'
  spec.add_development_dependency 'racc', '~> 1.4'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  spec.add_development_dependency 'minitest-reporters', '~> 1.0'

  spec.add_dependency 'activesupport', '~> 4.0'
  spec.add_dependency 'multi_json', '~> 1.0'
end
