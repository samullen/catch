require 'faraday'
require 'faraday_middleware'

$LOAD_PATH.unshift(File.dirname(__FILE__))

module Catch
  class << self
    attr_accessor :username
    attr_accessor :password

    def configure
      yield self
      true
    end
  end

  require 'catch/note'
  require 'catch/user'
  require 'catch/client'
end
