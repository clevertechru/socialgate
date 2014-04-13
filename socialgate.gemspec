# encoding: utf-8
$: << File.expand_path('../lib', __FILE__)
require 'socialgate/version'
# require 'socialgate/vkontakte'
require 'socialgate/vkontakte/groups'
require 'socialgate/resolvable'
require 'socialgate/resolver'
require 'socialgate/method'
require 'socialgate/namespace'

Gem::Specification.new do |s|
  s.name        = 'socialgate'
  s.version     = SocialGate::VERSION
  s.authors     = ['Vitali Makarov']
  s.email       = ['405112@gmail.com']
  s.homepage    = 'http://github.com/clevertechru/socialgate'
  s.summary     = %q{social gate}
  s.description = %q{social gate}
  s.license     = 'MIT'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  
  s.required_ruby_version = '>= 1.9.2'
  
  s.add_runtime_dependency 'faraday',                     '~> 0.9'
  s.add_runtime_dependency 'oauth2',                      '~> 0.9'
  s.add_runtime_dependency 'hashie',                      '~> 2.0'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'mechanize'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rb-fsevent', '~> 0.9.1'
  s.add_development_dependency 'terminal-notifier-guard'
  
  s.add_development_dependency 'pry'
  s.add_development_dependency 'awesome_print'
  
  s.add_development_dependency 'yard'
  s.add_development_dependency 'redcarpet'
end
