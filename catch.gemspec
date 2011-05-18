# -*- encoding: utf-8 -*-
require File.expand_path("../lib/catch/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "catch"
  s.version     = Catch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Samuel Mullen"]
  s.email       = ["samullen@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/catch"
  s.summary     = "Ruby wrapper for Catch.com's API"
  s.description = "Ruby wrapper for Catch.com's API"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "catch"

  s.add_dependency('hashie', '>= 1.0.0')
  s.add_dependency('faraday', '>= 0.6.1')
  s.add_dependency('faraday_middleware', '>= 0.6.3')

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency('fakeweb', '>= 1.3.0')

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
