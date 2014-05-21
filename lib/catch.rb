require 'faraday'
require 'faraday_middleware'

$LOAD_PATH.unshift(File.dirname(__FILE__))

module Catch
  class << self
    attr_accessor :username
    attr_accessor :password

    # Configures default credentials easily
    # @yield [username, password]
    def configure
      yield self
      true
    end
  end

  require 'catch/comment'
  require 'catch/media'
  require 'catch/note'
  require 'catch/place'
  require 'catch/search'
  require 'catch/tag'
  require 'catch/user'
  require 'catch/client'
  require 'catch/cli'
end
