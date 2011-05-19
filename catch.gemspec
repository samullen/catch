# -*- encoding: utf-8 -*-
require File.expand_path("../lib/catch/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "catch"
  s.version     = Catch::VERSION
  s.authors     = ["Samuel Mullen"]
  s.email       = ["samullen@gmail.com"]
  s.homepage    = "http://github.com/samullen/catch"
  s.summary     = "Ruby wrapper for Catch.com's API"
  s.description = "Ruby wrapper for the Catch.com's API"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency('faraday_middleware', '~> 0.6')
  s.add_dependency('hashie', '~> 1.0.0')
  s.add_dependency('multi_json', '~> 1.0.0')

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency('fakeweb', '>= 1.3.0')

  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
end
