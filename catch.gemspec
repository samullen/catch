# -*- encoding: utf-8 -*-
require File.expand_path("../lib/catch/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "catch"
  s.version     = Catch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Samuel Mullen"]
  s.email       = ["samullen@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/catch"
  s.summary     = "TODO: Write a gem summary"
  s.description = "TODO: Write a gem description"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "catch"

# dependencies
# hashie
# fakeweb
# faraday
# faraday_middleware

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end